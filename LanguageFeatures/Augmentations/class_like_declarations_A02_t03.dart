// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a class marked `augment` has a
/// primary constructor (`primaryConstructor`) or contains a primary constructor
/// initializer block (`primaryConstructorBodySignature`).
///
/// @description Check that it is a compile-time error if a class marked
/// `augment` has a named primary constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C1.someName();

augment class C1.someName() {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

class C2.someName(int v);

augment class C2.someName(int v) {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

class C3.someName(var int v);

augment class C3.someName(var int v) {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

class C4._(final int v);

augment class C4._(final int v) {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
}
