/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a super method invocation i of the form
 * super.m(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k)
 * proceeds as follows:
 * First, the argument list (a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) is evaluated
 * yielding actual argument objects o1, ... , on+k. Let S be the superclass of
 * the immediately enclosing class, and let f be the result of looking up method m in S with
 * respect to the current library L.
 * Let p1 ... ph be the required parameters of f, let p1 ... pm be the positional parameters
 * of f and let ph+1, ..., ph+l be the named parameters declared by f .
 * If n < h, or n > m, the method lookup has failed. Furthermore, each
 * xi, n+1 <= i <= n+k, must have a corresponding named parameter in the set
 * {pm+1, ... , ph+l} or the method lookup also fails. Otherwise method lookup has succeeded.
 * If the method lookup succeeded, the body of
 * f is executed with respect to the bindings that resulted from the evaluation of
 * the argument list, and with this bound to the current value of this. The value
 * of i is the value returned after f is executed.
 * @description Checks that the method lookup fails if a form super.m() has a
 * parameters mismatch listed above with the enclosing class's instance method.
 * @static-warning
 * @author ilya
 */
import '../../../../Utils/expect.dart';

class S {
  positional(x, y, [u, v]) {}
  named(x, y, {foo, bar}) {}
}

class C extends S {
  test() {
    Expect.throws(() => super.positional(1));
    Expect.throws(() => super.positional(1, 2, 3, 4, 5));
    Expect.throws(() => super.named(1));
    Expect.throws(() => super.named(1, 2, 3));
    Expect.throws(() => super.named(1, 2, foo:0, a:1));
  }
}

main()  {
  var c = new C().test();
}
