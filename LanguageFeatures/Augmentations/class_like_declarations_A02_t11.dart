// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a class marked `augment` has a
/// primary constructor (`primaryConstructor`) or contains a primary constructor
/// initializer block (`primaryConstructorBodySignature`).
///
/// @description Check that it is not an error to augment a primary constructor
/// in a class, enum or extension type not marked as `augment`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C1(var int v) {
  augment C1(int v);
}

class C2.someName(final int v) {
  this;
  augment C2.someName(int v);
}

enum E(final int v) {
  e0(0);
  augment E(int v);
}

extension type ET(int v) {
  augment ET(int v);
}

main() {
  Expect.equals(1, C1(1).v);
  Expect.equals(2, C1(2).v);
  Expect.equals(0, E.e0.v);
  Expect.equals(3, ET(3).v);
}
