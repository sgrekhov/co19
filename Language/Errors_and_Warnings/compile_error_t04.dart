// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Compile-time errors are errors that preclude execution.
/// A compile-time error must be reported by a Dart compiler before the
/// erroneous code is executed.
/// @description Checks that erroneous code is not executed if there is
/// a compile-time error. Test error in nested function
/// @compile-error
/// @author sgrekhov@unipro.ru


import '../../Utils/expect.dart';

void f1() {
  f2();
}

void f2() {
  var a = ;
}

main() {
  f1();
  Expect.fail("Erroneous code must not be executed");
}
