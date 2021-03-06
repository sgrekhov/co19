/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A cascaded method invocation has the form e..suffix where suffix is a sequence
 * of operator, method, getter or setter invocations.
 * cascadeSection:
 * '..'  (cascadeSelector arguments*)(assignableSelector arguments*)* (assignmentOperator expressionWithoutCascade)?
 * ;
 * cascadeSelector:
 *  '[ ' expression '] '
 *  | identifier
 * ;
 * @description Checks that it is a compile-time error if suffix is a string literal.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

class C {
  m1() {}
}

main() {
  var o = new C();
  try {
    o..'';
  } catch(e) {}
}

