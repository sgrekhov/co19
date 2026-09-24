// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a class marked `augment` has a
/// primary constructor (`primaryConstructor`) or contains a primary constructor
/// initializer block (`primaryConstructorBodySignature`).
///
/// @description Check that it is a compile-time error if a class marked
/// `augment` has a primary constructor. Test optional and named parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C1([int v = 0]);

augment class C1([int v = 0]) {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

class C2([var int v = 0]);

augment class C2([var int v = 0]) {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

class C3({int v = 0});

augment class C3({int v = 0}) {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

class C4({final int v = 0});

augment class C4({final int v = 0}) {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

class C5({required int v});

augment class C5({required int v}) {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
}
