/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The switch statement supports dispatching control among a large number of cases.
 * switch '(' expression ')' '{' switchCase* defaultCase? '}'
 * ;
 * switchCase:
 * label* (case expression ':') statements
 * ;
 * defaultCase:
 * label* default ':' statements
 * ;
 * @description Checks that it is a compile-time error if a case expression is not followed
 * by a colon character.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

switchTest(value){
  var result;
  
  switch (value) {
    case 0 result = 0; break;
    default: result = -1;
  }
  return result;
}

main() {
  try {
    switchTest(0);
  } catch(x) {}
}
