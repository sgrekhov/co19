/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If F is not a function type, the static type of i is Dynamic.
 * Otherwise the static type of i is the declared return type of F.
 * @description Checks that the static type of a method invocation is Dynamic
 * when F is not a function type (but can be assigned to it) by ensuring that 
 * there're no static warnings when a result of such invocation is being assigned 
 * to variables with various declared types.
 * @static-clean
 * @author rodionov
 * @reviewer iefremov
 */
import "../../../Utils/expect.dart";

class C {
  static Object f1;
}

class A {}

main() {
  try {
    String foo = C.f1();
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch(e) {}

  try {
    bool foo = C.f1();
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch(e) {}

  try {
    A foo = C.f1();
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch(e) {}

  try {
    Object foo = C.f1();
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch(e) {}

  try {
    List foo = C.f1();
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch(e) {}

  try {
    Map foo = C.f1();
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch(e) {}
}
