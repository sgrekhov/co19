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
/// @description Checks that if a type `T` is made a type of interest in `U`
/// then some variable cannot be promoted to `T` in `D`, `C` and `S`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  for ([s = T(), s.answer()];; s is T ? 1: 2) {
//                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

test2() {
  S s = S();
  [
    for ([s = T(), s.answer()];; s is T ? 1: 2) 0
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ];
}

test3() {
  S s = S();
  <int>{
    for ([s = T(), s.answer()];; s is T ? 1: 2) 0
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

test4() {
  S s = S();
  <int, int>{
    for ([s = T(), s.answer()];; s is T ? 1: 2) 0: 0
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

test5() {
  S s = S();
  for (; [s = T(), s.answer()] == []; s is T ? 1: 2) {
//                   ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

test6() {
  S s = S();
  [
    for (; [s = T(), s.answer()] == []; s is T ? 1: 2) 0
//                     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ];
}

test7() {
  S s = S();
  <int>{
    for (; [s = T(), s.answer()] == []; s is T ? 1: 2) 0
//                     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

test8() {
  S s = S();
  <int, int>{
    for (; [s = T(), s.answer()] == []; s is T ? 1: 2) 0: 0
//                     ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

test9() {
  S s = S();
  for (;; s is T ? 1: 2) {
    s = T();
    s.answer();
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

test10() {
  S s = S();
  [
    for (;; s is T ? 1: 2)
      [s = T(), s.answer()]
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  ];
}

test11() {
  S s = S();
  <List<Object>>{
    for (;; s is T ? 1 : 2)
      [s = T(), s.answer()]
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

test12() {
  S s = S();
  <S, int>{
    for (;; s is T ? 1 : 2)
      s = T(): s.answer()
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
  print(test5);
  print(test6);
  print(test7);
  print(test8);
  print(test9);
  print(test10);
  print(test11);
  print(test12);
}
