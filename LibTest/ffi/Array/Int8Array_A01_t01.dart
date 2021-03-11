/*
 * Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * const Array<T extends NativeType>(int dimension1)
 *  Const constructor to specify Array dimensions in Structs.
 *
 * @description Checks that this class represents a fixed-size array of Int8
 * @author sgrekhov@unipro.ru
 */
import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

class MyStruct extends Struct {
  @Array(2)
  external Array<Int8> a0;
}

void main() {
  final pointer = calloc<MyStruct>();
  try {
    final array = pointer.ref.a0;
    for (int i = 0; i < 2; i++) {
      array[i] = i + 1;
      Expect.equals(i + 1, array[i]);
      array[i] = 127;
      Expect.equals(127, array[i]);
      array[i] = 128;
      Expect.equals(-128, array[i]);
      array[i] = -129;
      Expect.equals(127, array[i]);
    }
  } finally {
    calloc.free(pointer);
  }
}
