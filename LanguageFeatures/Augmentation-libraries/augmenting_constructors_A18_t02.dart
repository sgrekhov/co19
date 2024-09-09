// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting generative constructors
/// ...
/// It is a compile-time error if:
/// - The augmented constructor has any initializers or a body.
///
/// @description Checks that it is a compile-time error to declare an augmenting
/// redirecting generative constructor if the augmented constructor has a
/// non-empty initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_constructors_A18_t02_lib.dart';

class C {
  int x, y;
  C(this.x, [this.y = 0]);
  C.foo(int x, {int y = 0}): assert(x > 0);
  C.bar({required int x}): x = x, y = 0;
}

main() {
  print(C);
}
