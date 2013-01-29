/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Relational expressions invoke the relational operators on objects.
 * relationalExpression:
 *   shiftExpression (typeTest | typeCast | relationalOperator shiftExpression)? |
 *   super relationalOperator shiftExpression
 * ;
 * relationalOperator:
 *   '>=' |
 *   '>' |
 *   '<=' |
 *   '<'
 * ;
 * A relational expression is either a shift expression, or an invocation
 * of a relational operator on either super or an expression e1, with argument e2.
 * @description Checks that a type parameter can be used
 * as the first operand in a relational expression without a compile error.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */

class A<T> {
  test() {
    try{
      T < 1; /// static type warning - no such method/operator, see "Ordinary invocation"
      throw "Exception expected.";
    } catch(e) {}
  }
}

main() {
  A a = new A();
  a.test();
}
