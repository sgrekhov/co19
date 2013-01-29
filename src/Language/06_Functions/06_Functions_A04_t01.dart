/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the last statement of a function is not a return statement, the statement
 * return null; is implicitly appended to the function body.
 * @description Checks that the statement return null; is implicitly appended to the function body.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 */

func() {}

f() {
  int x = 1;
  int y = x + 1;
}

void g() {}

main() {
  Expect.equals(null, func());
  Expect.equals(null, f());
  Expect.equals(null, g()); /// static type warning using the value of a void function (g())
}
