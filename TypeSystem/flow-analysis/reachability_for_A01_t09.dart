// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion for statement: If `N` is a for statement of the form
/// `for (D; C; U) S,` then:
/// - Let `before(D) = before(N)`.
/// - Let `before(C) = conservativeJoin(after(D), assignedIn(N), capturedIn(N))`
/// - Let `before(S) = split(true(C))`.
/// - Let `before(U) = merge(after(S), continue(S))`.
/// - Let `after(N) = inheritTested(join(false(C), unsplit(break(S))), after(U))`
///
/// @description Checks that
/// `before(C) = conservativeJoin(after(D), assignedIn(N), capturedIn(N))`. Test
/// that if a value of `captured` is `true` in `after(D)` then it is `true` in
/// `before(C)` as well.
/// @author sgrekhov22@gmail.com

int? x = (2 > 1) ? 1 : null;

test1(int? n) {
  if (n != null) { // n promoted to `int`
    for (() {n = x;}; n > 0;) { // n demoted to `int?`
//                      ^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

test2(int? n) {
  if (n != null) {
    [
      for (() {n = x;}; n > 0;) 0
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
    ];
  }
}

test3(int? n) {
  if (n != null) {
    <int, int>{
      for (() {n = x;}; n > 0;) 0: 0
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}

main() {
  print(test1);
  print(test2);
  print(test3);
}
