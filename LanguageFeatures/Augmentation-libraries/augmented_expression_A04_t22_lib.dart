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
/// @description Checks that it is a compile-time error to augment a function
/// whose name is `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A04_t22.dart';

augment augmented() {}
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C1 {
  augment static void augmented() {}
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C2 {
  augment void augmented() {}
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C3 {
  augment factory C3.augmented() => C3();
//                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M1 {
  augment static void augmented() {}
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M2 {
  augment void augmented() {}
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E1 {
  augment e1;

  augment static void augmented() {}
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E2 {
  augment e1;

  augment void augmented() {}
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext1 {
  augment static void augmented() {}
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext2 {
  augment void augmented() {}
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET1 {
  augment static void augmented() {}
//                    ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET2 {
  augment void augmented() {}
//             ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET3 {
  augment factory C3.augmented() => C3();
//                   ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
