/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 * metadata abstract? class identifier typeParameters? (superclass mixins?)? interfaces?
 *   '{' (metadata classMemberDefinition)* '}'
 * @description Checks that it is a compile-time error if type parameters are separated with semicolon.
 * @compile-error
 * @author kaigorodov
 * @reviewer iefremov
 */

class A<T1;T2>{}

main() {
  try {
    A a = new A();
  } catch (e) {}
}
