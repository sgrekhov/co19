// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the extends keyword. For a variable or
/// parameter, a var keyword may replace the type.
///
/// When applying an augmenting declaration that contains a type annotation at
/// one of these positions, to a definition to be augmented, it's a compile-time
/// error if the type denoted by the augmenting declaration is not the same type
/// as the type that the augmented definition has at the corresponding position.
/// An augmenting declaration can omit type annotations, but if it doesn't, it
/// must repeat the type from the augmented definition.
///
/// @description Check that it is a compile-time error if augmenting declaration
/// specifies a formal parameter type other than the augmented declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'type_inheritance_A04_t05.dart';

augment void topLevelFunction(Object? v) {}
//                            ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
augment void set topLevelSetter(Object? v) {}
//                              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C {
  augment static void staticMethod(Object? v) {}
//                                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set staticSetter(Object? v) {}
//                              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod(final Object? v) {}
//                                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter(Object? v) {}
//                                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment static void staticMethod(Object? v) {}
//                                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set staticSetter(Object? v) {}
//                              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod(final Object? v) {}
//                                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter(Object? v) {}
//                                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  augment e0;
  augment static void staticMethod(Object? v) {}
//                                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set staticSetter(Object? v) {}
//                              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod(final Object? v) {}
//                                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter(Object? v) {}
//                                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment static void staticMethod(Object? v) {}
//                                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set staticSetter(Object? v) {}
//                              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod(final Object? v) {}
//                                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter(Object? v) {}
//                                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment static void staticMethod(Object? v) {}
//                                 ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set staticSetter(Object? v) {}
//                              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod(final Object? v) {}
//                                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter(Object? v) {}
//                                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
