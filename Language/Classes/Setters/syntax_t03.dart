/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * setterSignature:
 *   returnType? set identifier formalParameterList
 * ;
 * methodSignature:
 *   static? setterSignature
 * ; 
 * @description Checks that it is a compile-time error if the setter 
 * parameter list is missing.
 * @compile-error
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 */

class C {
  set setter => null;
}

main() {
  try {
    new C();
  } catch (e) {}
}
