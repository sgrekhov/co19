// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting operators: When augmenting an operator, `augmented` must be
///   followed by the operator. For example when augmenting `+` you must do
///   `augmented + 1`, and when augmenting `[]` you must do `augmented[<arg>]`.
///   These constructs invoke the augmented operator, and are the only valid
///   uses of `augmented` in these contexts.
///
/// @description Checks that `augmented + v` inside of an augmenting operator
/// invokes an augmented operator `+` with `v` as an argument.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A05_t13.dart';
import '../../Utils/expect.dart';

augment class C {
  augment String operator +(Object other) {
    Expect.equals("C: Augment1 + $other", augmented + other);
    return "C: Augment2 + $other";
  }
}

augment mixin M {
  augment String operator +(Object other) {
    Expect.equals("M: Augment1 + $other", augmented + other);
    return "M: Augment2 + $other";
  }
}

augment enum E {
  augment e1;
  augment String operator +(Object other) {
    Expect.equals("E: Augment1 + $other", augmented + other);
    return "E: Augment2 + $other";
  }
}

augment extension Ext {
  augment String operator +(Object other) {
    Expect.equals("Ext: Augment1 + $other", augmented + other);
    return "Ext: Augment2 + $other";
  }
}
