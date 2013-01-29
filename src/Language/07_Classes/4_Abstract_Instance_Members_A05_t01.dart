/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unless explicitly stated otherwise, all ordinary rules that apply to methods
 * apply to abstract methods.
 * 7.1: It is a static warning if an instance method m1 overrides an instance 
 * member m2 and the type of m1 is not a subtype of the type of m2.
 * @description Checks that a static warning is produced when the return type of an abstract 
 * method m1 is not a subtype of the return type of non-abstract m2 (parameters of both methods
 * being completely identical).
 * @static-warning
 * @author rodionov
 * @reviewer kaigorodov
 */

class A {
  int foo(var x) {}
}

abstract class B extends A {
  String foo(var x); /// static type warning
}

class C extends B {
  String foo(var x) { /// static type warning
  }
}

main() {
  new C().foo(2);
}

