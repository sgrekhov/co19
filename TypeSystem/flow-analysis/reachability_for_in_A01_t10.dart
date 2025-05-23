// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion for each statement: If `N` is a for statement of the form
/// `for (T X in E) S`, `for (var X in E) S`, or `for (X in E) S`, then:
/// - Let `before(E) = before(N)`
/// - Let `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`
/// - Let `after(N) = join(before(S), break(S))`
///
/// @description Checks that if `E` has type `Never` or `List<Never>` then an
/// assignment in `X` or `S` is unreachable. Test use of a definitely unassigned
/// variable in dead code.
/// @author sgrekhov22@gmail.com
/// @issue 60395

Never foo() => throw "Never";

test1() {
  late int i;
  for (i in foo()) {}
  i; // Possibly assigned. See https://github.com/dart-lang/sdk/issues/60395
}

test2(Never n) {
  late int i;
  for (var j in n) {
    i = 42;
  }
  i; // Possibly assigned.
}

test3(Never n) {
  late int i;
  for (i in [n]) {}
  i; // Possibly assigned.
}

main() {
  print(test1);
  print(test2);
  print(test3);
}
