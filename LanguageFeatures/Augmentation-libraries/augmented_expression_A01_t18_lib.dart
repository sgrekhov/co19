// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// - Augmenting getters: Within an augmenting getter `augmented` invokes the
///   augmented getter and evaluates to its return value. If augmenting a
///   variable with a getter, this will invoke the implicitly induced getter
///   from the augmented variable declaration.
///
/// @description Checks that it is a compile-time error if an augmenting
/// getter has return type with the name `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A01_t18.dart';

augment augmented? get topLevelGetter => null;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static augmented? get staticGetter => null;
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment augmented? get instanceGetter => null;
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static augmented? get staticGetter => null;
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment augmented? get instanceGetter => null;
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e1;

  augment static augmented? get staticGetter => null;
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment augmented? get instanceGetter => null;
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static augmented? get staticGetter => null;
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment augmented? get instanceGetter => null;
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static augmented? get staticGetter => null;
//               ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augment augmented? get instanceGetter => null;
//        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
