// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting fields: Within an augmenting field, augmented can only be used
///   in an initializer expression, and refers to the original field's
///   initializer expression, which is immediately evaluated.
///
/// It is a compile-time error to use augmented in an augmenting field's
/// initializer if the member being augmented is not a field with an initializer
///
/// @description Checks that it is a compile-time error to use a type whose name
/// is `augmented` in `is` and `as` expressions.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A03_t31.dart';

augment var topLevelVariable = () {
  print(null as augmented);
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  print(null is augmented);
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
};

augment final finalTopLevelVariable = () {
  print(null as augmented);
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  print(null is augmented);
//              ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
};

augment class C {
  augment static var staticVariable = () {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  augment static final finalStaticVariable = () {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  augment var instanceVariable = () {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  augment final finalInstanceVariable = () {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

augment mixin M {
  augment static var staticVariable = () {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  augment static final finalStaticVariable = () {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  augment var instanceVariable = () {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  augment final finalInstanceVariable = () {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

augment enum E {
  augment e1;

  augment static var staticVariable = () {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  augment static final finalStaticVariable = () {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  augment final finalInstanceVariable = () {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}

augment extension Ext {
  augment static var staticVariable = () {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
  augment static final finalStaticVariable = () {
    print(null as augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    print(null is augmented);
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}