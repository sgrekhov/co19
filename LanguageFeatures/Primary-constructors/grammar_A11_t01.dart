// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion <primaryConstructor> ::= // New rule.
//      'const'? <typeWithParameters> ('.' <identifierOrNew>)?
//      <declaringParameterList>;
///
/// @description Check that it is a warning if a primary constructor annotated
/// by the `literal` annotation is called without `const` keyword.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import 'package:meta/meta.dart';

class const C() {
  @literal
  this;
}

mixin class const M() {
  @literal
  this;
}

extension type const ET(int _) {
  @literal
  this;
}

main() {
  final c = C();
//          ^
// [analyzer] STATIC_WARNING.NON_CONST_CALL_TO_LITERAL_CONSTRUCTOR

  final m = M();
//          ^
// [analyzer] STATIC_WARNING.NON_CONST_CALL_TO_LITERAL_CONSTRUCTOR

  final et = ET(0);
//           ^^
// [analyzer] STATIC_WARNING.NON_CONST_CALL_TO_LITERAL_CONSTRUCTOR
}
