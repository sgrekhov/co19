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
/// @description Checks that it is a compile-time error if a `covariant`
/// modifier of parameters of an augmentation doesn't exactly match the original
/// function.
/// @author sgrekhov22@gmail.com
/// @issue 55478

// SharedOptions=--enable-experiment=macros

part 'augmenting_functions_A04_t16_lib.dart';

class C {
  void instanceMethod1(covariant num i) {}
  void instanceMethod2([covariant num i = 1]) {}
  void instanceMethod3({covariant num i = 1}) {}
  void instanceMethod4({required covariant num i}) {}
}

mixin M {
  void instanceMethod1(covariant num i) {}
  void instanceMethod2([covariant num i = 1]) {}
  void instanceMethod3({covariant num i = 1}) {}
  void instanceMethod4({required covariant num i}) {}
}

enum E {
  e1;

  void instanceMethod1(covariant num i) {}
  void instanceMethod2([covariant num i = 1]) {}
  void instanceMethod3({covariant num i = 1}) {}
  void instanceMethod4({required covariant num i}) {}
}

main() {
  print(C);
  print(M);
  print(E);
}
