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
/// It is a compile-time error to use `augmented` in an augmenting field's
/// initializer if the member being augmented is not a field with an initializer
///
/// @description Checks that it is not an error to use `augmented` in an
/// augmenting field's initializer if the member being augmented is a field
/// with an initializer. Test late variables.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A03_t32.dart';
import augment 'augmented_expression_A03_t32_lib2.dart';

augment late String? topLevelVariable;

augment class C {
  augment static String? staticVariable;
  augment String? instanceVariable;
}

augment mixin M {
  augment static String? staticVariable;
  augment String? instanceVariable;
}

augment enum E {
  augment e1;

  augment static String? staticVariable;
  final String? instanceVariable;
}

augment extension Ext {
  augment static String? staticVariable;
}
