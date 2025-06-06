// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion switch expression: If `N` is a switch expression of the form
/// `switch (E) {alternatives}` then:
/// - Let `before(E) = split(before(N))`.
/// - For each case `Cj` in `alternatives` with expression `Ej`, for `j` in
///   `1 .. k`:
///   - Let `before(Ej) = after(E)`.
/// - Let `after(N) = join(after(E1), after(E2), .. after(Ek))`.
/// TODO (sgrekhov): there is no switch expression in the flow analysis spec yet
/// (April 2025). Update the assertion after spec update.
///
/// @description Checks that if a variable was assigned in `E` then it is
/// definitely assigned in `after(N)`.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

void test1() {
  int i;
  var x = switch (i = 42) {
    1 => 1, // ignore: constant_pattern_never_matches_value_type
    _ =>  0
  };
  i; // Definitely assigned
}

void test2() {
  int i;
  var x = switch ((i,) = (42,)) {
    1 => 1, // ignore: constant_pattern_never_matches_value_type
    _ =>  0
  };
  i; // Definitely assigned
}

void test3() {
  int i;
  var x = switch ((x: i) = (x: 42)) {
    1 => 1, // ignore: constant_pattern_never_matches_value_type
    _ =>  0
  };
  i; // Definitely assigned
}

void test4() {
  int i;
  var x = switch (C(v: i) = C(42)) {
    1 => 1, // ignore: constant_pattern_never_matches_value_type
    _ =>  0
  };
  i; // Definitely assigned
}

main() {
  test1();
  test2();
  test3();
  test4();
}
