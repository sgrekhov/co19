// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If the type annotation or type parameter bound is omitted in the
/// augmenting declaration, it is inferred to be the same as the corresponding
/// type annotation or type parameter bound in the declaration being augmented.
///
/// If the type annotation or type parameter bound is not omitted, then it's a
/// compile-time error if the type denoted by the augmenting declaration is not
/// the same type as the type in the corresponding declaration being augmented.
///
/// @description Check that it is a compile-time error if an augmenting
/// declaration specifies a type parameter bound other than the introductory
/// declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part 'type_inheritance_A05_t01_lib.dart';

void topLevelFunction1<T extends num>(T v) {}
void topLevelFunction2<T extends num>(T v);

class C<T extends num> {
  static void staticMethod<X extends num>(X _);
  void instanceMethod<X extends num>(X _) {}
}

mixin M<T extends num> {
  static void staticMethod<X extends num>(X _) {}
  void instanceMethod<X extends num>(X _);
}

enum E<T extends num> {
  e0;
  static void staticMethod<X extends num>(X _);
  void instanceMethod<X extends num>(X _) {}
}

class A {}

extension Ext<T extends num> on A {
  static void staticMethod<X extends num>(X _) {}
  void instanceMethod<X extends num>(X _);
}

extension type ET<T extends num>(int id) {
  static void staticMethod<X extends num>(X _);
  void instanceMethod<X extends num>(X _) {}
}

main() {
  print(topLevelFunction1);
  print(topLevelFunction2);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
