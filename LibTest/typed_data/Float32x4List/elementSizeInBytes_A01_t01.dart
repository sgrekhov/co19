/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int elementSizeInBytes
 * Returns the number of bytes in the representation
 * of each element in this list.
 * @description Checks that the number of bytes for each
 * element in an [Float32x4List] equals 1.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Float32x4List(0);
  Expect.equals(16, l.elementSizeInBytes);
}
