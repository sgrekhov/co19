// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion - Method invocation: If `N` is an expression of the form
/// `E1.m1(E2)`, then:
/// - Let `before(E1) = before(N)`
/// - Let `before(E2) = after(E1)`
/// - Let `T` be the static return type of the invocation
/// - If `T <: Never` then:
///   - Let `after(N) = unreachable(after(E2))`.
/// - Otherwise:
///   - Let `after(N) = after(E2)`.
///
/// @description Checks that for an expression of the form `E1..m1(E2)`, if the
/// static type of `E1` is not `Never` then `after(N) = after(E2)`. This is
/// tested by detecting that `i = 42` is considered to be guaranteed to have
/// been executed when `i;` is executed.
/// @note As of now (March 2025), cascade method invocation is still a TODO item
/// in the flow analysis specification. That's why cascaded invocation tests are
/// covered by this assertion, which does not mention cascades.
/// @author sgrekhov22@gmail.com

class C {
  void foo(int x) {}
  void bar([int x = 0]) {}
  void baz({int x = 0}) {}
  void qux({required int x}) {}
}

void test1() {
  int i;
  C()..foo(i = 42);
  i; // Definitely assigned
}

void test2() {
  int i;
  C()..bar(i = 42);
  i; // Definitely assigned
}

void test3() {
  int i;
  C()..baz(x: i = 42);
  i; // Definitely assigned
}

void test4() {
  int i;
  C()..qux(x: i = 42);
  i; // Definitely assigned
}

main() {
  test1();
  test2();
  test3();
  test4();
}
