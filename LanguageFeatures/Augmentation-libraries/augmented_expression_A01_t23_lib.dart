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
/// @description Checks that within an augmenting getter `augmented` invokes the
/// augmented getter and evaluates it to the return value. Test a local function
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A01_t23.dart';

augment String get topLevelGetter {
  String local() => "Augmented: ${augmented}";
  return local();
}

augment class C {
  augment static String get staticGetter {
    String local() => "Augmented: ${augmented}";
    return local();
  }
  augment String get instanceGetter {
    String local() => "Augmented: ${augmented}";
    return local();
  }
}

augment mixin M {
  augment static String get staticGetter {
    String local() => "Augmented: ${augmented}";
    return local();
  }
  augment String get instanceGetter {
    String local() => "Augmented: ${augmented}";
    return local();
  }
}

augment enum E {
  augment e1;

  augment static String get staticGetter {
    String local() => "Augmented: ${augmented}";
    return local();
  }
  augment String get instanceGetter {
    String local() => "Augmented: ${augmented}";
    return local();
  }
}

augment extension Ext {
  augment static String get staticGetter {
    String local() => "Augmented: ${augmented}";
    return local();
  }
  augment String get instanceGetter {
    String local() => "Augmented: ${augmented}";
    return local();
  }
}

augment extension type ET {
  augment static String get staticGetter {
    String local() => "Augmented: ${augmented}";
    return local();
  }
  augment String get instanceGetter {
    String local() => "Augmented: ${augmented}";
    return local();
  }
}
