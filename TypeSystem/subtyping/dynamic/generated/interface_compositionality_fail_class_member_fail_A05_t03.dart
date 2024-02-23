// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1
/// (written T0 <: T1) when:
/// ...
/// Interface Compositionality: `T0` is an interface type `C0<S0, ..., Sk>` and
/// `T1` is `C0<U0, ..., Uk>`. For `i` in `0..k`, let `vi` be the declared
/// variance of the `i`th type parameter of `C0`. Then, for each `i` in `0..k`,
/// one of the following holds:
///  - `Si <: Ui` and `vi` is absent or `out`.
///  - `Ui <: Si` and `vi` is `in`.
///  - `Si <: Ui` and `Ui <: Si`, and `vi` is `inout`.
///
/// @description Check that if type `T0` is an interface type `C0<S0, ..., Sk>`
/// and `T1` is `C0<U0, ..., Uk>` and there is `Uj <: Sj` but not vice versa
/// and `vj` is `inout` then `T0` is not a subtype of `T1`
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is not a subtype of a type T1, then
/// instance of T0 cannot be assigned to the mixin member of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/interface_compositionality_fail_A05.dart and
/// test_cases/class_member_fail_x03.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=variance

import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

abstract class U0 {}
// U1 is a subtype of S1, but S1 is not a subtype of U1
abstract class U1 extends S1 {}

typedef S0 = U0;
abstract class S1 {}

class C0<inout X, inout Y> {
  const C0();
}

C0<S0, S1> t0Instance = new C0<S0, S1>();
C0<U0, U1> t1Instance = new C0<U0, U1>();

const t1Default = const C0<U0, U1>();

mixin class ClassMemberSuper1_t03 {
  C0<U0, U1> m = t1Default;

  void set superSetter(C0<U0, U1> val) {}
}

class ClassMember1_t03 extends Object with ClassMemberSuper1_t03 {

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

class ClassMemberSuper2_t03<X> {
  X m;

  ClassMemberSuper2_t03(X x) : m = x {}

  void set superSetter(X val) {}
}

class ClassMember2_t03<X> extends ClassMemberSuper2_t03<X> {

  ClassMember2_t03(X x): super(x) {}

  test1() {
    m = forgetType(t0Instance);
  }

  test2() {
    superSetter = forgetType(t0Instance);
  }
}

main() {
  Expect.throws(() {
    new ClassMember1_t03().m = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t03().superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t03().test1();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember1_t03().test2();
  }, (e) => e is TypeError);

  // Test type parameters

  Expect.throws(() {
    new ClassMember2_t03<C0<U0, U1>>(t1Instance).m = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t03<C0<U0, U1>>(t1Instance).superSetter = forgetType(t0Instance);
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t03<C0<U0, U1>>(t1Instance).test1();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ClassMember2_t03<C0<U0, U1>>(t1Instance).test2();
  }, (e) => e is TypeError);
}
