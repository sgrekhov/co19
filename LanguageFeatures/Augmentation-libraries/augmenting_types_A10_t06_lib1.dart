// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Instance or static members defined in the body of the type,
/// including enum values, are added to the instance or static namespace of the
/// corresponding type in the augmented library. In other words, the
/// augmentation can add new members to an existing type.
///
/// @description Checks that it is a compile-time error if an augment of a
/// class, mixin, extension, or enum adds a static member but there is an
/// existing instance member with the same name
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_types_A10_t06.dart';

augment abstract class C {
  int foo();
}

augment mixin M {
  int get foo => 42;
}

augment enum E {
  augment e1;
  void set foo(String _) {}
}

augment extension ExtA {
  void bar() {}
}

augment extension type ET {
  void foo() {}
}
