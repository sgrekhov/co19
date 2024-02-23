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
/// and `T1` is `C0<U0, ..., Uk>` and each `Si <: Ui` and `Ui <: Si`, and `vi`
/// is `inout`. Then `T0` is a subtype of `T1`
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as a return value of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/interface_compositionality_A05.dart and
/// test_cases/return_value_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=variance

abstract class U0 {}

typedef S0 = U0;

class C0<inout X> {
  const C0();
}

C0<S0> t0Instance = new C0<S0>();

C0<U0> returnValueFunc() => t0Instance;

class ReturnValueTest {
  static C0<U0> staticTestMethod() => t0Instance;

  C0<U0> testMethod() => t0Instance;

  C0<U0> get testGetter => t0Instance;
}

main() {
  C0<U0> returnValueLocalFunc() => t0Instance;

  returnValueFunc();
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();

  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;
}
