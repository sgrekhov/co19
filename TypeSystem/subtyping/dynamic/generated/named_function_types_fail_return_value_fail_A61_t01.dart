// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A type T0 is a subtype of a type T1 (written T0 <: T1) when:
/// Named Function Types:
/// T0 is U0 Function<X0 extends B00, ..., Xk extends B0k>(V0 x0, ..., Vn xn,
///   {r0n+1 Vn+1 xn+1, ..., r0m Vm xm}) where r0j is empty or required for j in
///   n+1...m
/// and T1 is U1 Function<Y0 extends B10, ..., Yk extends B1k>(S0 y0, ...,
///   Sn yn, {r1n+1 Sn+1 yn+1, ..., r1q Sq yq}) where r1j is empty or required
///   for j in n+1...q
/// and {yn+1, ... , yq} subsetof {xn+1, ... , xm}
/// and Si[Z0/Y0, ..., Zk/Yk] <: Vi[Z0/X0, ..., Zk/Xk] for i in 0...n
/// and Si[Z0/Y0, ..., Zk/Yk] <: Tj[Z0/X0, ..., Zk/Xk] for i in n+1...q, yj = xi
/// and for each j such that r0j is required, then there exists an i in n+1...q
///   such that xj = yi, and r1i is required
/// and U0[Z0/X0, ..., Zk/Xk] <: U1[Z0/Y0, ..., Zk/Yk]
/// and B0i[Z0/X0, ..., Zk/Xk] === B1i[Z0/Y0, ..., Zk/Yk] for i in 0...k
/// where the Zi are fresh type variables with bounds B0i[Z0/X0, ..., Zk/Xk]
///
/// @description Check that if `T0` has a required named argument and `T1` has
/// an optional named argument of the same type and with the same name, then
/// `T0` is not a subtype of `T1`.
/// @author sgrekhov22@gmail.com
/// @issue 52928
///
/// @description Check that if type T0 not a subtype of a type T1, then instance
/// of T0 cannot be used as a return value of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/named_function_types_fail_A61.dart and
/// test_cases/return_value_fail_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

typedef void F0({required int i});
typedef void F1({int i});

void f0Instance({required int i}) {}
void f1Instance({int i = 0}) {}

F0 t0Instance = f0Instance;

F1 returnValueFunc() => forgetType(t0Instance);

class ReturnValueTest {
  static F1 staticTestMethod() => forgetType(t0Instance);

  F1 testMethod() => forgetType(t0Instance);

  F1 get testGetter => forgetType(t0Instance);
}

class ReturnValueGen<X> {
  X testMethod() => forgetType(t0Instance);
  X get testGetter => forgetType(t0Instance);
}

main() {
  F1 returnValueLocalFunc() => forgetType(t0Instance);

  Expect.throws(() {
    returnValueFunc();
  }, (e) => e is TypeError);
  Expect.throws(() {
    returnValueLocalFunc();
  }, (e) => e is TypeError);
  Expect.throws(() {
    ReturnValueTest.staticTestMethod();
  }, (e) => e is TypeError);

  Expect.throws(() {
    new ReturnValueTest().testMethod();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ReturnValueTest().testGetter;
  }, (e) => e is TypeError);

  // Test type parameters

  Expect.throws(() {
    new ReturnValueGen<F1>().testMethod();
  }, (e) => e is TypeError);
  Expect.throws(() {
    new ReturnValueGen<F1>().testGetter;
  }, (e) => e is TypeError);
}
