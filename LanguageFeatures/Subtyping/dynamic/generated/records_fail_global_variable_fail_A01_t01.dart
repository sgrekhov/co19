// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// A record type A is a subtype of record type B iff they have same shape and
/// the types of all fields of A are subtypes of the corresponding field types
/// of B
///
/// @description Check that if type T0 is a record with the other shape than T1
/// then T0 is not subtype of T1
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is not a subtype of a type T1, then
/// instance of T0 cannot be assigned to the to global variable of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from records_fail_A01.dart and 
/// global_variable_fail_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.


import '../../utils/common.dart';
import '../../../../Utils/expect.dart';

// SharedOptions=--enable-experiment=records

(int, String, bool) t0Instance = (1, "2", true);
(int, String) t1Instance = (3, "4");

const t1Default = const (5, "6");



class GlobalVariableTest {
  GlobalVariableTest() {
    t1Instance = forgetType(t0Instance);
  }

  GlobalVariableTest.valid() {}

  foo() {
    t1Instance = forgetType(t0Instance);
  }

  static test() {
    t1Instance = forgetType(t0Instance);
  }
}

main() {
  bar () {
    t1Instance = forgetType(t0Instance);
  }

  Expect.throws(() {
    t1Instance = forgetType(t0Instance);
  }, (e) => e is TypeError);

  Expect.throws(() {
    bar();
  }, (e) => e is TypeError);

  Expect.throws(() {
    new GlobalVariableTest();
  }, (e) => e is TypeError);

  Expect.throws(() {
    new GlobalVariableTest.valid().foo();
  }, (e) => e is TypeError);

  Expect.throws(() {
    GlobalVariableTest.test();
  }, (e) => e is TypeError);
}