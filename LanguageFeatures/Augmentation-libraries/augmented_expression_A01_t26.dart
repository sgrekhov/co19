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
/// augmented getter and evaluates it to the return value. Test a case when
/// `augmented` is called more than once.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmented_expression_A01_t26_lib.dart';

String get augmented => "Global getter, shouldn't be invoked";

String get topLevelGetter => "Original";

class C {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
  String get augmented => "C.augmented, shouldn't be invoked";
}

mixin M {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
  String get augmented => "M.augmented, shouldn't be invoked";
}

enum E {
  e1;

  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
  String get augmented => "E.augmented, shouldn't be invoked";
}

class A {
  String get augmented => "A.augmented, shouldn't be invoked";
}

extension Ext on A {
  static String get staticGetter => "Original";
  String get instanceGetter => "Original";
}

class MA = Object with M;

main() {
  Expect.equals("1: Original, 2: Original", topLevelGetter);
  Expect.equals("1: Original, 2: Original", C.staticGetter);
  Expect.equals("1: Original, 2: Original", C().instanceGetter);
  Expect.equals("1: Original, 2: Original", M.staticGetter);
  Expect.equals("1: Original, 2: Original", MA().instanceGetter);
  Expect.equals("1: Original, 2: Original", E.staticGetter);
  Expect.equals("1: Original, 2: Original", E.e1.instanceGetter);
  Expect.equals("1: Original, 2: Original", Ext.staticGetter);
  Expect.equals("1: Original, 2: Original", A().instanceGetter);
}
