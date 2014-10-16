/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Given an instance creation expression of the form const q(a1, ..., an) it is
 * a static warning if q is a constructor of an abstract class but q is not a
 * factory constructor.
 * @description Checks that an instance creation expression of the form const T.id(a1, .., an),
 * where T is an abstract class, produces a static warning.
 * It is also compile error if evaluation of const object throws an error.
 * @compile-error
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

abstract class A {
  const A.id();
}

main() {
  try {
    const A.id(); /// static type warning - invoking a non-factory constructor of an abstract class, see "Instance creation|Const"
  } catch(e) {}
}
