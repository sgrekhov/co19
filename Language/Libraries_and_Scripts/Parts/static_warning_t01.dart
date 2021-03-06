/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the referenced part declaration p
 * names a library other than the current library as the library to which p belongs.
 * @description Checks that it is a static warning if the referenced part
 * names another library, but not a compile-time error and all definitions
 * from such part are available without errors.
 * @author rodionov
 * @reviewer kaigorodov
 * @static-warning library name doesn't match that referenced by an included part
 */
library Parts_test_lib_not;
import "../../../Utils/expect.dart";
part "part_0.dart";

main() {
  Expect.equals("foo", foo);
  Expect.equals(1, bar);
}
