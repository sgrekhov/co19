/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a static warning if an abstract member is declared or
 * inherited in a concrete class unless that member overrides a concrete one.
 * @description Checks that it is a static warning if an abstract method is
 * declared in a concrete class.
 * @static-warning
 * @author kaigorodov
 * @reviewer rodionov
 */

class A {
  foo([x]); /// static type warning 
}

class B extends A {
  foo([x]) {}
}

main() {
  new B();
}
