/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Assignable expressions are expressions that can appear on the left hand side of
 * an assignment.
 * assignableExpression:
 *   primary (arguments* assignableSelector)+ |
 *   super assignableSelector |
 *   identifier
 * ;
 * assignableSelector:
 *   '[' expression ']' |
 *   '.' identifier
 * ;
 * primary:
 *   thisExpression |
 *   super assignableSelector |
 *   functionExpression |
 *   literal |
 *   identifier |
 *   newExpression |
 *   constantObjectExpression |
 *   '(' expression ')'
 * ;
 * literal:
 *   nullLiteral |
 *   booleanLiteral |
 *   numericLiteral |
 *   stringLiteral |
 *   symbolLiteral |
 *   mapLiteral |
 *   listLiteral
 * ;
 * @description Checks that a reference to a class declaration
 * can be used in the left hand side of an assignment without a compile error.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 */

class A {}

main() {
  try {
    A = 1; /// static type warning - incompatible types, see "Assignment" plus another unspecified warning
  } catch(e) {}
}
