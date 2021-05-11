// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Uint32List asUint32List([int offsetInBytes = 0, int length ])
/// Creates a Uint32List view of a region of this byte buffer.
/// ...
/// The start index and length must describe a valid 32-bit aligned range of the
/// buffer:
/// - offsetInBytes must not be negative,
/// - offsetInBytes must be divisible by four,
/// - length must not be negative, and
/// - offsetInBytes + length * 4 must not be greater than lengthInBytes.
/// @description Checks that creating Uint32List view with negative offset,
/// with offset not divisible by four, with negative length, or with
/// 'offsetInBytes + length * 4' greater then buffer length causes throwing
/// error at runtime.
/// @author ngl@unipro.ru


import "dart:typed_data";
import "../../../Utils/expect.dart";

void check(ByteBuffer buffer) {
  int shift = (Uint32List.bytesPerElement == 4) ? 2 : 0;
  // creates Uint32List view with negative offset
  Expect.throws(() {
    buffer.asUint32List(-1);
  });
  // creates Uint32List view with offset not divisible by four
  Expect.throws(() {
    buffer.asUint32List(1);
  });
  // creates Uint32List view with negative length
  Expect.throws(() {
    buffer.asUint32List(0, -8);
  });
  // creates Uint32List view with 'offsetInBytes + length * 4'
  // greater then buffer length
  Expect.throws(() {
    buffer.asUint32List(4, buffer.lengthInBytes >> shift);
  });
}

main() {
  var list2 = new List.filled(8, 0);
  var list4 = new Int32x4List(6);

  check((new Int8List.fromList(list2)).buffer);
  check((new Int16List.fromList(list2)).buffer);
  check((new Int32List.fromList(list2)).buffer);
  check((new Int64List.fromList(list2)).buffer);
  check((new Int32x4List.fromList(list4)).buffer);
}
