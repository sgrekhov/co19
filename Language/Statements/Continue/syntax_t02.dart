/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The continue statement consists of the reserved word continue and an optional
 * label.
 * continueStatement:
 * continue identifier? ';'
 * ;
 * @description Checks that it is a compile-time error if the continue statement does not
 * end with a semicolon.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */


main() {
  try {
    L: do {
      continue L
    } while(false);
  } catch(x) {}
}
