// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting functions: Inside an augmenting function body (including
///   factory constructors but not generative constructors) `augmented` refers
///   to the augmented function. Tear-offs are not allowed, and this function
///   must immediately be invoked.
///
/// @description Checks that within an augmenting function `augmented()` invokes
/// the augmented function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmented_expression_A04_t25_lib.dart';

String augmented() => "Global augmented() function, shouldn't be invoked";

String topLevelFunction() => "Original";

class C {
  String log = "";

  C(this.log);
  factory C.f() {
    return C("Original");
  }
  static String staticMethod() => "Original";
  String instanceMethod() => "Original";
  String augmented() => "C.augmented(), shouldn't be invoked";
}

mixin M {
  static String staticMethod() => "Original";
  String instanceMethod() => "Original";
  String augmented() => "M.augmented(), shouldn't be invoked";
}

enum E {
  e1;

  static String staticMethod() => "Original";
  String instanceMethod() => "Original";
  String augmented() => "E.augmented(), shouldn't be invoked";
}

class A {
  String augmented() => "A.augmented(), shouldn't be invoked";
}

extension Ext on A {
  static String staticMethod() => "Original";
  String instanceMethod() => "Original";
}

extension type ET(String v) {
  factory ET.f() {
    return ET("Original");
  }
  static String staticMethod() => "Original";
  String instanceMethod() => "Original";
}

class MA = Object with M;

main() {
  Expect.equals("Augmented", topLevelFunction());
  Expect.equals("Augmented", C.f());
  Expect.equals("Augmented", C.staticMethod());
  Expect.equals("Augmented", C("x").instanceMethod());
  Expect.equals("Augmented", M.staticMethod());
  Expect.equals("Augmented", MA().instanceMethod());
  Expect.equals("Augmented", E.staticMethod());
  Expect.equals("Augmented", E.e1.instanceMethod());
  Expect.equals("Augmented", Ext.staticMethod());
  Expect.equals("Augmented", A().instanceMethod());
  Expect.equals("Augmented", ET.f().v);
  Expect.equals("Augmented", ET.staticMethod());
  Expect.equals("Augmented", ET("x").instanceMethod());
}
