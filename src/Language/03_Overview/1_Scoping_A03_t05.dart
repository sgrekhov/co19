/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names may be introduced into a scope by  declarations within the
 * scope or by other mechanisms such as imports or inheritance.
 * @description Checks that it is a compile-time error if an inherited name conflicts with
 * a name in the library scope.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

class S {
  var x;
}

class C extends S {
  var x;
}

main() {
  try {
    new C().x = 1;
  } catch(var e) {}
}
