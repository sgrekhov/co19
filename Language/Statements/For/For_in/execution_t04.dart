/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A for statement of the form for (varOrType? id in e) s
 *  is equivalent to the following code:
 *    var n0 = e.iterator;
 *    while (n0.moveNext()) {
 *      varOrType? id = n0.current;
 *      s
 *    }
 *  where n0 is an identifier that does not occur anywhere in the program.
 * @description Checks that [NoSuchMethodError] is thrown when e is null. 
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../../Utils/expect.dart';

main() {
  List l;
  try {
    for ( var id in l ) {
    }
    Expect.fail("NoSuchMethodError expected when calling for statement");
  } on NoSuchMethodError catch(ok) {}   

  try {
    for ( dynamic id in l ) {
    }
    Expect.fail("NoSuchMethodError expected when calling for statement");
  } on NoSuchMethodError catch(ok) {}   

  try {
    var id;
    for ( id in l ) {
    }
    Expect.fail("NoSuchMethodError expected when calling for statement");
  } on NoSuchMethodError catch(ok) {}   
}
