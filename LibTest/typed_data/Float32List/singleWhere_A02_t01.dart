/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E singleWhere(bool test(E element))
 * If no or more than one element match then a [StateError] is thrown.
 * @description Checks that a [StateError] is thrown if no element
 * matches [test].
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float32List.fromList([]);
  try {
    l.singleWhere( (e) => true);
    Expect.fail("StateError is expected");
  } on StateError catch(ok) {}

  l = new Float32List.fromList([1.0, 2.0, 3.0, 4.0, 5.0]);
  try {
    l.singleWhere( (e) => e == 0);
    Expect.fail("StateError is expected");
  } on StateError catch(ok) {}

  l = new Float32List.fromList([1.0, 2.0, 3.0, 4.0, 5.0]);
  try {
    l.singleWhere( (e) => false);
    Expect.fail("StateError is expected");
  } on StateError catch(ok) {}
}

