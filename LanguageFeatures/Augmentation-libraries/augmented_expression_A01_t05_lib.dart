// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// - Augmenting getters: Within an augmenting getter `augmented` invokes the
///   getter and evaluates to the return value. If augmenting a field with a
///   getter, this will invoke the implicit getter from the augmented field.
///
/// @description Checks that it is not an error to invoke operator `+` on return
/// value of `augmented` expression if its return type has a `+` operator
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A01_t05.dart';

augment String get topLevelVariable {
  Expect.equals("Original:a", augmented + "a");
  return "Augmented";
}

augment class C {
  augment static String get staticGetter {
    Expect.equals("Original:b", augmented + "b");
    return "Augmented";
  }
  augment String get instanceGetter {
    Expect.equals("Original:c", augmented + "c");
    return "Augmented";
  }
}

augment mixin M {
  augment static String get staticGetter {
    Expect.equals("Original:d", augmented + "d");
    return "Augmented";
  }
  augment String get instanceGetter {
    Expect.equals("Original:e", augmented + "e");
    return "Augmented";
  }
}

augment enum E {
  augment e1;

  augment static String get staticGetter {
    Expect.equals("Original:f", augmented + "f");
    return "Augmented";
  }
  augment String get instanceGetter {
    Expect.equals("Original:g", augmented + "g");
    return "Augmented";
  }
}

augment extension Ext {
  augment static String get staticGetter {
    Expect.equals("Original:h", augmented + "h");
    return "Augmented";
  }
  augment String get instanceGetter {
    Expect.equals("Original:i", augmented + "i");
    return "Augmented";
  }
}
