/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Shift expressions invoke the shift operators on objects.
 * shiftExpression:
 *   additiveExpression (shiftOperator additiveExpression)* |
 *   super (shiftOperator additiveExpression)+
 * ;
 * shiftOperator:
 *   '<<' |
 *   '>>'
 * ;
 * A shift expression is either an additive expression, or an invocation
 * of a shift operator on either super or an expression e1, with argument e2.
 * @description Checks that a type parameter can be used
 * as the second operand of a shift expression without a compile error.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 */

class A<T> {
  test() {
    try {
      2 >> T; /// static type warning - incompatible argument type, see "Binding actuals to formals"
    } catch(e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
