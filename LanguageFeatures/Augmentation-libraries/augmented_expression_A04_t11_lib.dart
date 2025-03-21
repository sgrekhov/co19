// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting functions: Inside an augmenting function body (including
///   factory constructors but not generative constructors) `augmented` refers
///   to the augmented function. Tear-offs are not allowed, and this function
///   must immediately be invoked.
///
/// @description Checks that it is a compile-time error for an augmenting
/// function to declare a named parameter with the name `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A04_t11.dart';

augment void topLevelFunction({int augmented}) {
//                                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C {
  augment factory C.f({int augmented}) {
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return C();
  }
  augment static void staticMethod({int augmented}) {
//                                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment void instanceMethod({int augmented}) {
//                                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment mixin M {
  augment static void staticMethod({int augmented}) {
//                                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment void instanceMethod({int augmented}) {
//                                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment enum E {
  augment e1;

  augment static void staticMethod({int augmented}) {
//                                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment void instanceMethod({int augmented}) {
//                                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension Ext {
  augment static void staticMethod({int augmented}) {
//                                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment void instanceMethod({int augmented}) {
//                                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension type ET {
  augment factory ET.f({int augmented}) {
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return ET(0);
  }
  augment static void staticMethod({int augmented}) {
//                                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  augment void instanceMethod({int augmented}) {
//                                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
