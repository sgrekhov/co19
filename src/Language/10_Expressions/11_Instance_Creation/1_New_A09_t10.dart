/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion For each instance variable f of i, if the variable declaration
 * of f has an initializer, then f is bound to that value
 * (which is necessarily a compile-time constant). Otherwise f is bound to null.
 * Next, the argument list (a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) is
 * evaluated. Then, q is executed with this bound to i,
 * the type parameters (if any) of C bound to the actual type arguments V1, ..., Vm and
 * the formal parameters of q bound to the corresponding actual arguments.
 * The result of the evaluation of e is i.
 * @description Checks that arguments of a constructor and instance variables are bound correctly
 * when a redirecting constructor is invoked.
 * @author msyabro
 * @reviewer rodionov
 */

f(p1) {
  Expect.equals(1, p1);
  return 0;
}

class A {
  A(p1): this.redirected(p1);
  A.redirected(p1): x = f(p1), y = 2 + 3 {
    Expect.equals(1, p1);
    Expect.equals(5, y);
    Expect.equals(0, x);
    Expect.equals(1, z);
    Expect.isNull(n);
  }
  var x;
  var y;
  var z = 1;
  var n;
}

class B {
  B.name(p1): this.redirected(p1);
  B.redirected(p1): x = f(p1), y = 9 / 3 {
    Expect.equals(1, p1);
    Expect.equals(3, y);
    Expect.equals(0, x);
    Expect.equals("const string", z);
    Expect.isNull(n);
  }
  var x;
  var y;
  var z = "const string";
  var n;
}

main() {
  new A(1);
  new B.name(1);
}
