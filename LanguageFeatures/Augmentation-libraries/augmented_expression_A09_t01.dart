// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a declaration with the basename
/// `augmented` occurs in a location where any enclosing declaration is
/// augmenting.
///
/// @description Checks that it is a compile-time error if a declaration of a
/// variables with the name `augmented` occurs in a location where there is an
/// enclosing augmenting declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmented_expression_A09_t01_lib.dart';

class C1 {}
class C2 {}
mixin M1 {}
mixin M2 {}
enum E {e0;}

class A {}
extension Ext on A {}
extension type ET(int _) {}

main() {
  print(C1);
  print(C2);
  print(M1);
  print(M2);
  print(E);
  print(A);
  print(ET);
}
