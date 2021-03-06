/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion stringLiteral:
 *   (MULTI_LINE_STRING | SINGLE_LINE_STRING)+
 * ;
 * SINGLE_LINE_STRING:
 *   '"' STRING_CONTENT_DQ* '"'
 *   | ''' STRING_CONTENT_SQ* '''
 *   | 'r' ''' (~( ''' | NEWLINE ))* '''
 *   | 'r' '"' (~( '"' | NEWLINE ))* '"'
 * ;
 * STRING_CONTENT_DQ:
 *   ~( '\' | '"' | '$' | NEWLINE )
 *   | '\' ~( NEWLINE )
 *   | STRING_INTERPOLATION
 * ;
 * STRING_CONTENT_SQ:
 *   ~( '\' | ''' | '$' | NEWLINE )
 *   | '\' ~( NEWLINE )
 *   | STRING_INTERPOLATION
 * ;
 * NEWLINE:
 *   '\n'
 *   | '\r'
 * ;
 * @description Checks that a string can contain
 * any unicode new line symbols other than \r and \n.
 * @author msyabro
 * @reviewer iefremov
 */

main() {
  "verticaltab";
  "formfeed";
  "nextline";
  "line separator";
  "paragraph separator";

  'verticaltab';
  'formfeed';
  'nextline';
  'line separator';
  'paragraph separator';

  r"verticaltab";
  r"formfeed";
  r"nextline";
  r"line separator";
  r"paragraph separator";

  r'verticaltab';
  r'formfeed';
  r'nextline';
  r'line separator';
  r'paragraph separator';
}
