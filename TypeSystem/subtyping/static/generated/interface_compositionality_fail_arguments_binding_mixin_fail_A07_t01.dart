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
/// and `T1` is `C0<U0, ..., Uk>` and there is `Uj == dynamic`, `Sj != dynamic`
/// and `vj` is `inout` then `T0` is not a subtype of `T1`
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as an argument of type T1. Test mixin members. Super method required
/// argument is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru
///
/// This test is generated from test_types/interface_compositionality_fail_A07.dart and
/// test_cases/arguments_binding_mixin_fail_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=variance

abstract class U0 {}
typedef U1 = dynamic;

typedef S0 = U0;
class S1 {}

class C0<inout X, inout Y> {
  const C0();
}

C0<S0, S1> t0Instance = new C0<S0, S1>();
C0<U0, U1> t1Instance = new C0<U0, U1>();

const t1Default = const C0<U0, U1>();

mixin ArgumentsBindingSuper1_t03 {
  void superTest(C0<U0, U1> val) {}
  void superTestPositioned(C0<U0, U1> val, [C0<U0, U1> val2 = t1Default]) {}
  void superTestNamed(C0<U0, U1> val, {C0<U0, U1> val2 = t1Default}) {}
  C0<U0, U1> get superGetter => t0Instance;
//                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set superSetter(C0<U0, U1> val) {}
}

class ArgumentsBinding1_t03 extends Object with ArgumentsBindingSuper1_t03 {

  test() {
    superTest(t0Instance);
//            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTest(t0Instance);
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTest(t0Instance);
//                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superTestPositioned(t0Instance);
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTestPositioned(t0Instance);
//                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTestPositioned(t0Instance);
//                            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superTestPositioned(t1Instance, t0Instance);
//                                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTestPositioned(t1Instance, t0Instance);
//                                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTestPositioned(t1Instance, t0Instance);
//                                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superTestNamed(t0Instance);
//                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTestNamed(t0Instance);
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTestNamed(t0Instance);
//                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superTestNamed(t1Instance, val2: t0Instance);
//                                   ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superTestNamed(t1Instance, val2: t0Instance);
//                                        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superTestNamed(t1Instance, val2: t0Instance);
//                                         ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    superSetter = t0Instance;
//                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    this.superSetter = t0Instance;
//                     ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    super.superSetter = t0Instance;
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  new ArgumentsBinding1_t03().superTest(t0Instance);
//                                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t03().superTestPositioned(t0Instance);
//                                                ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t03().superTestPositioned(t1Instance, t0Instance);
//                                                            ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t03().superTestNamed(t0Instance);
//                                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t03().superTestNamed(t1Instance, val2: t0Instance);
//                                                             ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t03().superSetter = t0Instance;
//                                          ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  new ArgumentsBinding1_t03().test();
}
