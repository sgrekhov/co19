/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The name of a setter is obtained by appending the string ‘=’
 * to the identifier given in its signature. Hence, a setter name can never
 * conflict with, override or be overridden by a getter or method.
 * @description Checks that there is no compile-time error if a class has
 * an explicitly defined abstract setter inherited from a superclass and
 * an instance method with the same name.
 * @static-warning
 * @author iefremov
 * @reviewer kaigorodov
 */

abstract class A {
  void set foo(var x);
}

abstract class C extends A {
  factory C() {
    return new D();
  }
  C.c() {}
  foo(value) {} // static warning (Classes/Instance methods):
                // Class declares an instance method named n
                // and has a setter named n=
}

class D extends C {
  D():super.c();
  void set foo(var x){}
}

main() {
  C c = new C();
  c.foo(1);
  c.foo = 1;
}
