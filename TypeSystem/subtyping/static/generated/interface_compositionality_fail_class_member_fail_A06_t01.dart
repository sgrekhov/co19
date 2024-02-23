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
/// and `T1` is `C0<U0, ..., Uk>` and there is `Sj == dynamic`, `Uj != dynamic`
/// and `vj` is `inout` then `T0` is not a subtype of `T1`
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as a class member of type T1. Assignment to static and instance class
/// variables is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from test_types/interface_compositionality_fail_A06.dart and
/// test_cases/class_member_fail_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=variance

abstract class U0 {}
abstract class U1 {}

typedef S0 = U0;
typedef S1 = dynamic;

class C0<inout X, inout Y> {
  const C0();
}

C0<S0, S1> t0Instance = new C0<S0, S1>();

const t1Default = const C0<U0, U1>();

class ClassMemberTestStatic {
  static C0<U0, U1> s = t1Default;

  ClassMemberTestStatic(C0<S0, S1> val) {
    s = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static staticTest() {
    s = t0Instance;
//      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static set staticSetter(C0<S0, S1> val) {
    s = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static C0<U0, U1> get staticGetter => t0Instance;
//                               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class ClassMemberTestPublic {
  C0<U0, U1> m = t1Default;

  ClassMemberTestPublic(C0<S0, S1> val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  ClassMemberTestPublic.short(this.m);

  ClassMemberTestPublic.validConstructor() {}

  test(C0<S0, S1> val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  set setter(C0<S0, S1> val) {
    m = val;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  C0<U0, U1> get getter => t0Instance;
//                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class ClassMemberTestPrivate {
  C0<U0, U1> _m = t1Default;

  ClassMemberTestPrivate(C0<S0, S1> val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  ClassMemberTestPrivate.short(this._m);

  ClassMemberTestPrivate.validConstructor() {}

  test(C0<S0, S1> val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  set setter(C0<S0, S1> val) {
    _m = val;
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class ClassMemberTestInitFail {
  static C0<U0, U1> s = t0Instance;
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C0<U0, U1> m = t0Instance;
//        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new ClassMemberTestPublic.validConstructor().m = t0Instance;
//                                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
