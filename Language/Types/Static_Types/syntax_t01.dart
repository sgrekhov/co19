/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static type annotation grammar:
 * type:
 *   typeName typeArguments?
 * ;
 * typeName:
 *   qualified
 * ;
 * typeArguments:
 *   '<' typeList '>'
 * ;
 * typeList:
 *   type (',' type)*
 * ;
 * @description Checks that it is a compile-time error when the type arguments
 * in a static type annotation are enclosed in curly brackets instead of angle ones.
 * @author iefremov
 * @reviewer rodionov
 * @compile-error
 */

class Generic<T> {
  Generic() {}
}

main() {
  try {
    Generic{int} t;
  } catch(x){}
}
