/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a setter m1 overrides (7.9.1) a setter 
 * or method m2 and the type of m1 is not a subtype of the type of m2. 
 * @description Checks that a static warning is produced when the argument types of these
 * two setters are not mutually assignable even if one of the setters is defined implicitly.
 * @static-warning
 * @author vasya
 * @reviewer iefremov
 * @reviewer rodionov
 */

class A {
  String foo;
}

class C extends A {
  void set foo(bool b) { /// static type warning
  }
}

main() {
  new C().foo = null;
}
