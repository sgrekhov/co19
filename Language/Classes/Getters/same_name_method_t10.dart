// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * @assertion It is a compile-time error if a class has both a getter and a 
 * method with the same name. This restriction holds regardless of whether the 
 * getter is defined explicitly or implicitly, or whether the getter or the 
 * method are inherited or not.
 * @description Checks that a compile-time error is produced if a class has
 * an explicitly declared static getter and a method with the same name.
 * @author iefremov
 */

class C {
  static get foo { throw new C(); }
//           ^
// [analyzer] unspecified
// [cfe] unspecified

  foo() { throw new C(); }
}

main() {
  C().foo();
//    ^
// [cfe] unspecified
}
