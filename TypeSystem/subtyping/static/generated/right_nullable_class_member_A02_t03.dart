// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Right Nullable: if T1 is S1? then:
///  T0 <: T1 iff any of the following hold:
///  either T0 <: S1
///  or T0 <: Null
///  or T0 is X0 and X0 has bound S0 and S0 <: T1
///  or T0 is X0 & S0 and S0 <: T1
/// @description Check that if type T1 is S1? and T0 is Null then T0 is subtype
/// of T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the mixin member of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/right_nullable_A02.dart and
/// test_cases/class_member_x03.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

class S1 {
  const S1();
}

Null t0Instance = null;

const t1Default = const S1();

mixin class ClassMemberMixin1_t03 {
  S1? m = t1Default;

  void set superSetter(dynamic val) {}
}

class ClassMember1_t03 extends Object with ClassMemberMixin1_t03 {
  test() {
    m = t0Instance;
    superSetter = t0Instance;
  }
}

main() {
  ClassMember1_t03 c1 = new ClassMember1_t03();
  c1.m = t0Instance;
  c1.test();
  c1.superSetter = t0Instance;
}