// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting fields: Within an augmenting variable declaration, `augmented`
///   can only be used in an initializer expression, and refers to the augmented
///   variable's initializing expression, which is immediately evaluated.
///
/// It is a compile-time error to use `augmented` in an augmenting variable's
/// initializer if the member being augmented is not a variable declaration with
/// an initializing expression.
///
/// @description Checks that it is not an error to use `augmented` in an
/// augmenting field's initializer if the member being augmented is a field
/// with an initializer. Test late variables.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A03_t32.dart';
part 'augmented_expression_A03_t32_lib2.dart';

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
}

augment extension Ext {
  augment static String? staticVariable;
}

augment extension type ET {
  augment static String? staticVariable;
}
