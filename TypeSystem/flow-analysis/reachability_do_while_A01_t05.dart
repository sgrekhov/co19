// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion do while statement: If `N` is a do while statement of the form
/// `do S while (E)` then:
/// - Let `before(S) = conservativeJoin(before(N), assignedIn(N), capturedIn(N))`.
/// - Let `before(E) = join(after(S), continue(N))`
/// - Let `after(N) = join(false(E), break(S))`
///
/// @description Checks that `capturedIn(E)` is detected by flow analysis.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

test1(int? n) {
  if (n != null) { // n promoted to `int`
    do {
      n.isEven;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    } while ((() => (n = 42) < 0)()); // n demoted to `int?`
  }
}

test2(int? n) {
  if (n != null) { // n promoted to `int`
    do {
    } while ((() => (n = 42) < 0)()); // n demoted to `int?`
    n.isEven;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

test3(int? n) {
  if (n != null) { // n promoted to `int`
    do {
      n.isEven;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    } while (() {(n,) = (42,); return false;}()); // n demoted to `int?`
  }
}

test4(int? n) {
  if (n != null) { // n promoted to `int`
    do {
      n.isEven;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    } while (() {(x: n) = (x: 42); return false;}()); // n demoted to `int?`
  }
}

test5(int? n) {
  if (n != null) { // n promoted to `int`
    do {
      n.isEven;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    } while (() {C(v: n) = C(42); return false;}()); // n demoted to `int?`
  }
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
  print(test5);
}
