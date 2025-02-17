// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion - type cast If `N` is an expression of the form `E1 as S` where
/// the static type of `E1` is `T` then:
/// - Let `before(E1) = before(N)`
/// - Let `after(N) = promote(E1, S, after(E1))`
///
/// @description Checks that flow analysis promotes a variable after a type cast
/// inside collection literals.
/// @author sgrekhov22@gmail.com

class A {}
class C extends A {
  int foo() => 42;
}

void test1(A o) {
  <Object> [
    o as C,
    o.foo()
  ];
}

void test2(A o) {
  <Object>{
    o as C,
    o.foo()
  };
}

void test3(A o) {
  <String, Object>{
    "key1": o as C,
    "key2": o.foo()
  };
}

void test4(A o) {
  <Object, String>{
    o as C: "value1",
    o.foo(): "value2"
  };
}

main() {
  test1(C());
  test2(C());
  test3(C());
  test4(C());
}
