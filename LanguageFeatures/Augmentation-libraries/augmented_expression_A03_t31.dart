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
/// @description Checks that it is a compile-time error to use a type whose name
/// is `augmented` in `is` and `as` expressions.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A03_t31_lib.dart';

typedef augmented = Null;

String foo() => "Original";

var topLevelVariable = foo;
final finalTopLevelVariable = foo;

class C {
  static var staticVariable = foo;
  static final finalStaticVariable = foo;
  var instanceVariable = foo;
  final finalInstanceVariable = foo;
}

mixin M {
  static var staticVariable = foo;
  static final finalStaticVariable = foo;
  var instanceVariable = foo;
  final finalInstanceVariable = foo;
}

enum E {
  e1;

  static var staticVariable = foo;
  static final finalStaticVariable = foo;
  final finalInstanceVariable = foo;
}

class A {}

extension Ext on A {
  static var staticVariable = foo;
  static final finalStaticVariable = foo;
}

extension type ET(int _) {
  static var staticVariable = foo;
  static final finalStaticVariable = foo;
}

main() {
  print(topLevelVariable);
  print(finalTopLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
