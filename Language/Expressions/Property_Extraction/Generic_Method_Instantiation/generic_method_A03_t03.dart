// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider the situation where generic function type instantiation
/// succeeded. Let `gmiNameid` be a fresh name which is associated with `id`,
/// which is private `if` and only if id is private.
/// ...
/// Let `o` be an instance of a class which contains an implicitly induced
/// declaration of `gmiNameid` as described above. Consider the situation where
/// the program evaluates two invocations of this method with the same receiver
/// `o`, and with actual type arguments whose actual values are the same types
/// `t1, ..., ts` for both invocations, and assume that the invocations returned
/// the instances `o1` respectively `o2`. It is then guaranteed that `o1` and
/// `o2` are equal according to operator ‘==’.
///
/// @description Check that two generic method instantiation of the same method
/// of a form `super.id` are equal according to the `==` operator.
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

class A {
  X foo<X extends num>(X x) => x;
}

class C extends A {
  int v;
  C(this.v);
  X foo<X extends num>(X x) => x + v as X;

  void test() {
    int Function(int) f1 = super.foo;
    int Function(int) f2 = super.foo;
    Expect.isTrue(f1 == f2);
  }
}

void main() {
  C(1).test();
}
