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
/// and `T1` is `C0<U0, ..., Uk>` and each `Si <: Ui` and `vi` is `out`. Then
/// `T0` is a subtype of `T1`
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the to local variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/interface_compositionality_A03.dart and
/// test_cases/local_variable_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

// SharedOptions=--enable-experiment=variance

import '../../utils/common.dart';

abstract class U0 {}
abstract class U1 {}
abstract mixin class U2 {}

abstract class S0 extends U0 {}
abstract class S1 implements U1 {}
class S2 = Object with U2;

class C0<out X, out Y, out Z> {
  const C0();
}

C0<S0, S1, S2> t0Instance = new C0<S0, S1, S2>();

class LocalVariableTest {

  LocalVariableTest() {
    C0<U0, U1, U2> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  static staticTest() {
    C0<U0, U1, U2> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  test() {
    C0<U0, U1, U2> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }
}

main() {
  foo() {
    C0<U0, U1, U2> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  C0<U0, U1, U2> t1 = forgetType(t0Instance);
  t1 = forgetType(t0Instance);
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
