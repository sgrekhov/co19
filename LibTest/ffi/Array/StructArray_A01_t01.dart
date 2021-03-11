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
 * @description Checks that this class represents a fixed-size array of Pointer
 * @author sgrekhov@unipro.ru
 */
import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

class Coord extends Struct {
  @Double()
  external double x;
  @Double()
  external double y;
}

class MyStruct extends Struct {
  @Array(2)
  external Array<Coord> a0;
}

void main() {
  final pointer = calloc<MyStruct>();
  try {
    final array = pointer.ref.a0;
    for (int i = 0; i < 2; i++) {
      Expect.equals(0, array[i].x);
      Expect.equals(0, array[i].y);
      array[i].x = 42;
      array[i].y = 3.14;
      Expect.equals(42, array[i].x);
      Expect.equals(3.14, array[i].y);
    }
  } finally {
    calloc.free(pointer);
  }
}
