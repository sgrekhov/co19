// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In support of the notion that the value of an expression with
/// static type `void` should be discarded, such objects can only be used in
/// specific situations: The occurrence of an expression of type `void` is a
/// compile-time error unless it is permitted according to one of the following
/// rules.
/// ...
/// - In an expression of the form `e1 = e2` where `e1` is an
///   `⟨assignableExpression⟩` denoting a variable or formal parameter of type
///   `void`, `e2` may have type `void`.
///
/// @description Checks that in an expression of the form `e1 = e2` where `e1`
/// is an `⟨assignableExpression⟩` denoting a formal parameter of type `void`,
/// `e2` may have type `void`.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

void foo(void e1) {
  void e2 = 42;
  e1 = e2;
  Expect.equals(42, e1 as int);
}

void main() {
  foo(0);
}
