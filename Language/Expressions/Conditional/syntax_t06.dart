/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A conditional expression evaluates one of two expressions
 * based on a boolean condition.
 * conditionalExpression:
 *   logicalOrExpression ('?' expressionWithoutCascade ':' expressionWithoutCascade)?
 * ;
 * @description Checks that the second expression is necessary.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  try {
    true ?  : 2;
  } catch(e) {}
}
