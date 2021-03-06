/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num pow(num x, num y)
 * if x is 0.0 and y is positive, the result is 0.0.
 * @description Checks the result when [x] is 0.0 and [y] is positive.
 * @author pagolubev
 * @reviewer msyabro
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

main() {
  Expect.equals(.0, Math.pow(.0, 111));
  Expect.equals(.0, Math.pow(.0, 111.0));
  Expect.equals(.0, Math.pow(.0, 9223372036854775809));
  Expect.equals(.0, Math.pow(.0, double.INFINITY));
}
