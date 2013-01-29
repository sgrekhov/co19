/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a name N is referenced by a library L and N is introduced into the top
 * level scope L by more than one import then:
 * - It is a static warning if N is used as a type annotation.
 * - In checked mode, it is a dynamic error if N is used as a type annotation
 *   and referenced during a subtype test.
 * - Otherwise, it is a compile-time error.
 * It is neither an error nor a warning if N is introduced by two or more imports
 * but never referred to.
 * @description Checks that it is a static warning and a dynamic type error in checked mode if two different 
 * libraries introduce the same name to the top level scope of A and A uses it as a type parameter
 * bound (which is a type annotation too).
 * @static-warning
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../Utils/dynamic_check.dart";

import "1_Imports_A03_t01_p1_lib.dart";
import "1_Imports_A03_t01_p2_lib.dart";

class Foo2<T extends foo> { /// static-warning
}

main() {
  checkTypeError(() {
//    new Foo2(); // subtype test takes a shortcut, apparently - no type error
  new Foo2<int>();
  });
}
