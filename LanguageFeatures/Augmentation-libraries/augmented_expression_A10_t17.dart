// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a non-augmenting member declaration Dm that occurs
/// inside an augmenting type declaration Dt. A compile-time error occurs if the
/// identifier `augmented` occurs in Dm.
///
/// @description Checks that it is a compile-time error to declare a local
/// function with a constant with name `augmented` as a default value of a
/// formal parameter, in a non-augmenting member declaration inside an
/// augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmented_expression_A10_t17_lib.dart';

const augmented = "Should not be used";

class C {}

mixin M {}

enum E {
  e1;
}

class A {}

extension Ext on A {}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
}
