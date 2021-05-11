// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Legacy if T0 is S0* then:
/// - T0 <: T1 iff S0 <: T1.
/// @description Check that if type T0 is S0* and S0 <: T1 then T0 is subtype of
/// T1.
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as a class member of type T1. Assignment to static and instance class
/// variables is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from left_legacy_fail_A02.dart and 
/// class_member_fail_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.



import "../../utils/legacy_lib.dart";

class A extends X {
  const A();
}

X t0Instance = new X();
A t1Instance = new A();

const t1Default = const A();




class ClassMemberTestStatic {
  static A s = t1Default;

  ClassMemberTestStatic(X val) {
    s = val;
  }

  static staticTest() {
    s = t0Instance;
  }

  static set staticSetter(X val) {
    s = val;
  }

  static A get staticGetter => t0Instance;
}

class ClassMemberTestPublic {
  A m = t1Default;

  ClassMemberTestPublic(X val) {
    m = val;
  }

  ClassMemberTestPublic.short(this.m);

  ClassMemberTestPublic.validConstructor() {}

  test(X val) {
    m = val;
  }

  set setter(X val) {
    m = val;
  }

  A get getter => t0Instance;
}

class ClassMemberTestPrivate {
  A _m = t1Default;

  ClassMemberTestPrivate(X val) {
    _m = val;
  }

  ClassMemberTestPrivate.short(this._m);

  ClassMemberTestPrivate.validConstructor() {}

  test(X val) {
    _m = val;
  }

  set setter(X val) {
    _m = val;
  }
}

class ClassMemberTestInitFail {
  static A s = t0Instance;
  A m = t0Instance;
}

main() {
  new ClassMemberTestPublic.validConstructor().m = t0Instance;
}
