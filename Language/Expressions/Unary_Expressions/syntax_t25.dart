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
 * @description Checks that it's a compile-time error when a '!'
 * precedes a statement that isn't an expression (block statement).
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer rodionov
 */

main() {
  try {
    !{int x; x = 1;};
  } catch(e) {}
}
