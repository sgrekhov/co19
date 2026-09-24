// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if a class marked `augment` has a
/// primary constructor (`primaryConstructor`) or contains a primary constructor
/// initializer block (`primaryConstructorBodySignature`).
///
/// @description Check that it is a compile-time error if an enum marked
/// `augment` has a primary constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

enum E1() {
  e0;
}

augment enum E1() {
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

enum E2(final int v) {
  e0(0);
}

augment enum E2(final int v) {
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

enum E3([final int v = 0]) {
  e0();
}

augment enum E3([final int v = 0]) {
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

enum E4.someName(final int v) {
  e0.someName(0);
}

augment enum E4.someName(final int v) {
//           ^^
// [analyzer] unspecified
// [cfe] unspecified
  ;
}

main() {
  print(E1);
  print(E2);
  print(E3);
  print(E4);
}
