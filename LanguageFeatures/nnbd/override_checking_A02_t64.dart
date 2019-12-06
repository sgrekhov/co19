/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In a migrated library, override checking must check that an
 * override is consistent with all overridden methods from other migrated
 * libraries in the super-interface chain, since a legacy library is permitted
 * to override otherwise incompatible signatures for a method.
 *
 * @description Check that if opted-in class implements two classes (one is
 * legacy), child opted-in method can return non-nullable value.
 *
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "../../Utils/expect.dart";
import "override_checking_legacy_lib.dart";

abstract class B1 {
  int? test_return_nullable();
}

abstract class B2 {
  int test_return_nullable();
}

class A1 implements A, B1 {
  int test_return_nullable() => 1;

  void test_never(Null i) {}
  Null test_return_never() => null;
  int? aField1 = 1;
  int? aField2 = 2;
  int? aField3 = 3;
  int? get get_field1 => -1;
  int? get get_field2 => -2;
  int? get get_field3 => -3;
  void set set_field1(int? i) {}
  void set set_field2(int? i) {}
  void set set_field3(int? i) {}
}

class A2 implements A, B2 {
  int test_return_nullable() => 2;

  void test_never(Null i) {}
  Null test_return_never() => null;
  int? aField1 = 1;
  int? aField2 = 2;
  int? aField3 = 3;
  int? get get_field1 => -1;
  int? get get_field2 => -2;
  int? get get_field3 => -3;
  void set set_field1(int? i) { aField1 = -1; }
  void set set_field2(int? i) { aField1 = -2; }
  void set set_field3(int? i) { aField1 = -3; }
}

main() {
  Expect.equals(1, A1().test_return_nullable());
  Expect.equals(2, A2().test_return_nullable());
}
