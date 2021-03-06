/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unary expressions invoke unary operators on objects.
 *   unaryExpression:
 *          preﬁxOperator unaryExpression |
 *          postﬁxExpression |
 *          (minusOperator | tildeOperator) super |
 *          incrementOperator assignableExpression
 *   ;
 *   preﬁxOperator:
 *          minusOperator |
 *          negationOperator |
 *          tildeOperator
 *   ;
 *   minusOperator:
 *        ‘-’ |
 *   ;
 *   negationOperator:
 *        ‘!’ |
 *   ;
 *   tildeOperator:
 *        ‘˜’
 *   ;
 * @description Checks that '-' can be used with
 * a reference to a class declaration without a compile error.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

class A {}

main() {
  try {
    -A; /// static type warning - no such method/operator, see "Ordinary invocation"
  } catch(e) {}
}
