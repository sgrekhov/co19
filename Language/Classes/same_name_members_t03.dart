/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a class declares two members of the same name.
 * @description Checks that it is a compile-time error if a class declares 
 * a function and a static getter of the same name.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

class C {
  void f() {}
  static void get f {}
}

main() {
  try {
    C c = new C();
  } catch (e) {}
}
