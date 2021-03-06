/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is possible to embed expressions within non-raw string literals,
 * such that these expressions are evaluated, and the resulting values are converted
 * into strings and concatenated with the enclosing string. This process is known as
 * string interpolation.
 * STRING_INTERPOLATION:
 *   '$' IDENTIFIER_NO_DOLLAR
 *   | '$' '{' Expression '}'
 * ;
 * @description Checks that it is a compile-time error if a string interpolation construct
 * contains a statement (variable declaration) instead of an expression.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  try {
    "${var x = 1}";
  } catch(e) {}
}
