// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Assume that DV declares an extension type declaration named Name with type
/// parameters X1 .. Xs, and V1 is a superinterface of DV. Then Name<T1, .. Ts>
/// is a subtype of [T1/X1 .. Ts/Xs]V1 for all T1, .. Ts.
///
/// @description Check that an extension type `ET<T1, ..., Ts>` is a subtype of
/// an extension type `ET<X1, ..., Xs>` if `Ti` is a subtype of `Xi` for all
/// `i`. Test union types.
/// @author sgrekhov22@gmail.com
/// @issue 55578
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be assigned to the to local variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/extension_type_A11.dart and
/// test_cases/local_variable_x01.dart. Don't modify it!
/// If you need to change this test, then change one of the files above and then
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';

import "dart:async";

extension type ET(Future<int> _) implements Future<int> {}

ET t0Instance = ET(Future<int>(() => 2));

class LocalVariableTest {

  LocalVariableTest() {
    FutureOr<int> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  static staticTest() {
    FutureOr<int> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  test() {
    FutureOr<int> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }
}

main() {
  foo() {
    FutureOr<int> t1 = forgetType(t0Instance);
    t1 = forgetType(t0Instance);
  }

  FutureOr<int> t1 = forgetType(t0Instance);
  t1 = forgetType(t0Instance);
  foo();
  LocalVariableTest x = new LocalVariableTest();
  x.test();
  LocalVariableTest.staticTest();
}
