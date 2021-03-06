/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The for statement supports iteration.
 * forStatement:
 *   for '(' forLoopParts ')' statement
 * ;
 * forLoopParts:
 *   forInitializerStatement expression? ';' expressionList? |
 *   declaredIdentifier in expression |
 *   identifier in expression
 * ;
 * forInitializerStatement:
 *   localVariableDeclaration ‘;’ |
 *   expression? ';'
 * ;
 * @description Checks that it is a runtime error when the iteration variable identifier
 * in a 'identifier in expression' loop variety is not declared prior to the for statement.
 * @static-warning
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

main() {
  try {
    for (l in new List(5)) /// static type warning
      break;
    Expect.fail("NoSuchMethodError expected when calling undefined getter.");
  } on NoSuchMethodError catch (ex) {}
}
