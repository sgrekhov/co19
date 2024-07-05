// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a declaration with the name
/// `augmented` occurs in a location where the outermost enclosing declaration
/// is augmenting.
///
/// @description Checks that it is a compile-time error to declare a local
/// variable whose name is `augmented` in a location where the outermost
/// enclosing declaration is augmenting. Test an object pattern.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmented_expression_A09_t13.dart';

augment class C {
  static void staticMethod() {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  static int get staticGetter {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
    return 0;
  }

  static void set staticSetter(int _) {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  void instanceMethod() {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  int get instanceGetter {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
    return 0;
  }

  void set instanceSetter(int _) {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

augment mixin M {
  static void staticMethod() {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  static int get staticGetter {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
    return 0;
  }

  static void set staticSetter(int _) {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  void instanceMethod() {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  int get instanceGetter {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
    return 0;
  }

  void set instanceSetter(int _) {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

augment enum E {
  augment e0;
  static void staticMethod() {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  static int get staticGetter {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
    return 0;
  }

  static void set staticSetter(int _) {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  void instanceMethod() {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  int get instanceGetter {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
    return 0;
  }

  void set instanceSetter(int _) {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

augment extension Ext {
  static void staticMethod() {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  static int get staticGetter {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
    return 0;
  }

  static void set staticSetter(int _) {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  void instanceMethod() {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }

  int get instanceGetter {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
    return 0;
  }

  void set instanceSetter(int _) {
    switch(1) {
      case int(isEven: var augmented):
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}