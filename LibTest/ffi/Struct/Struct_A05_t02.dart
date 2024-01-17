// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All field declarations in a Struct subclass declaration must
/// either have type int or double and be annotated with a NativeType
/// representing the native type, or must be of type Pointer or subtype of
/// Struct or Union.
///
/// @description Checks that 'Struct' subtype value depends on annotation
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

final class S1 extends Struct {
  @Int64()
  external int x;
}

final class S2 extends Struct {
  @Int16()
  external int x;
}

final class S3 extends Struct {
  @Uint16()
  external int x;
}

void main() {
  Pointer<S1> s1 = calloc<S1>();
  try {
    s1.ref.x = 0x1111222233334444;
    Expect.equals(0x1111222233334444, s1.ref.x);

    Pointer<S2> s2 = new Pointer.fromAddress(s1.address);
    Expect.equals(0x4444, s2.ref.x);
    Expect.equals(0x3333, (s2 + 1).ref.x);
    Expect.equals(0x2222, (s2 + 2).ref.x);
    Expect.equals(0x1111, (s2 + 3).ref.x);

    Pointer<S3> s3 = new Pointer.fromAddress(s1.address);
    Expect.equals(0x4444, s3.ref.x);
    Expect.equals(0x3333, (s3 + 1).ref.x);
    Expect.equals(0x2222, (s3 + 2).ref.x);
    Expect.equals(0x1111, (s3 + 3).ref.x);

    s1.ref.x = 0xFFFFFFFFFFFFFFFF;
    Expect.equals(-1, s2.ref.x);
    Expect.equals(65535, s3.ref.x);
  } finally {
    calloc.free(s1);
  }
}
