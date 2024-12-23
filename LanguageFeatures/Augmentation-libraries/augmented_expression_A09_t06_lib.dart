// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a declaration with the basename
/// `augmented` occurs in a location where any enclosing declaration is
/// augmenting.
///
/// @description Checks that it is a compile-time error if a declaration of a
/// member with a return type whose name is `augmented` occurs in a location
/// where there is an enclosing augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A09_t06.dart';

augment class C {
  static augmented? staticVariable = null;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static augmented? get staticGetter => null;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static augmented? staticMethod() => null;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augmented? instanceVariable = null;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augmented? get instanceGetter => null;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augmented? instanceMethod() => null;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  static augmented? staticVariable = null;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static augmented? get staticGetter => null;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static augmented? staticMethod() => null;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augmented? instanceVariable = null;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augmented? get instanceGetter => null;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augmented? instanceMethod() => null;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  static augmented? staticVariable = null;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static augmented? get staticGetter => null;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static augmented? staticMethod() => null;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final augmented? instanceVariable = null;
//      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augmented? get instanceGetter => null;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augmented? instanceMethod() => null;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  static augmented? staticVariable = null;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static augmented? get staticGetter => null;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static augmented? staticMethod() => null;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augmented? get instanceGetter => null;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augmented? instanceMethod() => null;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  static augmented? staticVariable = null;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static augmented? get staticGetter => null;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static augmented? staticMethod() => null;
//       ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augmented? get instanceGetter => null;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  augmented? instanceMethod() => null;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
