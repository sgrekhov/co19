// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Instance or static members defined in the body of the type,
/// including enum values, are added to the instance or static namespace of the
/// corresponding type in the augmented library. In other words, the
/// augmentation can add new members to an existing type.
///
/// @description Checks that it is a compile-time error if an augment of a
/// class, mixin or enum adds an instance member but there is an existing
/// instance member with the same name
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_types_A10_t02_lib.dart';

abstract class C {
  int foo();
  int operator +(int other);
}

mixin M {
  int get foo => 42;
  int operator +(int other) => other;
}

enum E {
  e1;
  void set foo(String _) {}
  int operator +(int other) => other;
}

main() {
  print(C);
  print(M);
  print(E);
}
