/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Fails gracefully when given an argument of a wrong type.
 * @description Checks that the method doesn't crash.
 * @static-warning
 * @author iefremov
 * @needsreview undocumented
 */

main() {
  Expect.throws(() => new Date.now().difference(1)); /// static type warning
  Expect.throws(() => new Date.now().difference(3.14)); /// static type warning
  Expect.throws(() => new Date.now().difference("")); /// static type warning
}
