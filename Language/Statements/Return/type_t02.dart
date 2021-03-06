/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if the type of e may not be assigned
 * to the declared return type of the immediately enclosing function.
 * @description Checks that no static warning occurs if the type of e may 
 * be assigned to the declared return type of the immediately enclosing function.
 * @static-clean
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/dynamic_check.dart';

abstract class I {}
class S implements I {}
class C extends S {}

S foo() {  return new C(); }
I foo2() { return new C(); }
C bar() {  return new S(); }

main() {
  foo();
  foo2();
  checkTypeError(() => bar());
}
