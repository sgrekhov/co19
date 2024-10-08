// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Synthetic getters cannot be augmented with metadata or doc
/// comments.
///
/// @description Checks that it is a compile-time error to augment a variable by
/// an augmenting getter with an empty body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part 'augmenting_getters_A03_t01_lib.dart';

String topLevelVariable = "Original";

class C {
  static String staticVariable = "Original";
  String instanceVariable = "Original";
}

mixin M {
  static String staticVariable = "Original";
  String instanceVariable = "Original";
}

enum E {
  e0;
  static String staticVariable = "Original";
  final String instanceVariable = "Original";
}

class A {}

extension Ext on A {
  static String staticVariable = "Original";
}

extension type ET(String _) {
  static String staticVariable = "Original";
}

main() {
  print(topLevelVariable);
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
