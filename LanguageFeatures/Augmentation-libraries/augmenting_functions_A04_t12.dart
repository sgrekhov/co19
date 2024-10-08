// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The function signature of the augmenting function does not exactly match
///   the function signature of the augmented function. This means that any
///   provided return types must be the same type; there must be same number or
///   required and optional positional parameters, all with the same types (when
///   provided), the same number of named parameters, each pairwise with the
///   same name, same type (when provided) and same `required` and `covariant`
///   modifiers, and any type parameters and their bounds (when provided) must
///   be the same (like for type declarations).
///
/// @description Checks that it is a compile-time error if names of type
/// parameters of an augmentation doesn't exactly match the original function.
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=macros

part 'augmenting_functions_A04_t12_lib.dart';

void topLevelFunction<T>() {}

class C {
  static void staticMethod<T>() {}
  void instanceMethod<T>() {}
}

mixin M {
  static void staticMethod<T>() {}
  void instanceMethod<T>() {}
}

enum E {
  e1;

  static void staticMethod<T>() {}
  void instanceMethod<T>() {}
}

class A {}

extension Ext on A {
  static void staticMethod<T>() {}
  void instanceMethod<T>() {}
}

extension type ET(int _) {
  static void staticMethod<T>() {}
  void instanceMethod<T>() {}
}

main() {
  print(topLevelFunction);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
