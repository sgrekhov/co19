// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The introductory constructor is marked `factory` and the augmenting
/// constructor is not, or vice versa.
///
/// @description Checks that it is a compile-time error if the augmenting
/// constructor is marked `factory` and the introductory constructor is not.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_constructors_A04_t02_lib.dart';

class C {
  C();
  C.foo();
}

extension type ET(int id) {
  ET.foo(this.id);
  ET.bar(int id);
}

main() {
  print(C);
  print(ET);
}
