// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a non-augmenting member declaration Dm that occurs
/// inside an augmenting type declaration Dt. A compile-time error occurs if the
/// identifier `augmented` occurs in Dm.
///
/// @description Checks that it is a compile-time error to declare a local
/// function with a constant with name `augmented` as a default value of a 
/// formal parameter, in a non-augmenting member declaration inside an
/// augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A10_t17.dart';

augment class C {
  static var staticVariable = () {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  var instanceVariable = () {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  void instanceMethod() {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment mixin M {
  static var staticVariable = () {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  var instanceVariable = () {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  void instanceMethod() {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment enum E {
  augment e1;
  static var staticVariable = () {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void instanceMethod() {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension Ext {
  static var staticVariable = () {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void instanceMethod() {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension type ET {
  static var staticVariable = () {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };

  static void staticMethod() {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  static int get staticGetter {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  static void set staticSetter(int _) {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  void instanceMethod() {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int get instanceGetter {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    return 0;
  }

  void set instanceSetter(int _) {
    void local1([String v = augmented]) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    void local2({String v = augmented}) {}
//                          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
