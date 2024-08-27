// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The representation field clause must be present on the
/// declaration which introduces the extension type, and must be omitted from
/// all augmentations of the extension type.
///
/// @description Checks that it is a compile-time error to specify the
/// representation declaration in an augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'extension_types_A01_t01_lib.dart';

extension type ET1(int id) {}

extension type ET2.foo(int id) {}

extension type ET3.new(int id) {}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
}
