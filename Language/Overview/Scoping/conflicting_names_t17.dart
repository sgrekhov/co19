/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart is lexically scoped. Scopes may nest. A name or declaration d is
 * available in scope S if d is in the namespace induced by S or if d is available
 * in the lexically enclosing scope of S. We say that a name or declaration d is in
 * scope if d is available in the current scope.
 * It is a compile-time error if there is more than one entity with the same name 
 * declared in the same scope, with the exception of the operator -, where both 
 * a unary and a binary version may coexist.
 * @description Checks that it is a compile-time error if a function body contains
 * two local functions with the same name.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

func() {
  conflictingName() {};
  conflictingName(p1) {};
}

main() {
  try {
    func();
  } catch(e) {}
}
