/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion stringLiteral:
 *   (MULTI_LINE_STRING | SINGLE_LINE_STRING)+
 * ;
 * MULTI_LINE_STRING:
 *   '"""' STRING CONTENT TDQ* '"""' |
 *   ''''' STRING CONTENT TSQ* ''''' |
 *   '"""'  (~ '"""')* '"""' |
 *   ''''' (~ ''''')* '''''
 * ;
 * STRING CONTENT TDQ:
 *   ~( '\' | '"""' | '$') |
 *   STRING_INTERPOLATION
 * ;
 * STRING CONTENT TSQ:
 *   ~( '\' | ''''' | '$') |
 *   STRING_INTERPOLATION
 * ;
 * @description Checks that multi-line strings that contain character sequences prohibited
 * by this grammar, cause compile-time errors.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */

main() {
  """$""";
}
