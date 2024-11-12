// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a return statement `s` of the form `return e?;`. Let `S`
/// be the static type of `e`, if `e` is present, let `f` be the immediately
/// enclosing function, and let `T` be the declared return type of `f`.
///
/// Case ⟨Synchronous non-generator functions⟩. Consider the case where `f` is a
/// synchronous non-generator function. It is a compile-time error if `s` is
/// `return;`, unless `T` is `void`, `dynamic`, or `Null`.
///
/// @description Checks that it is a compile-time error if a statement of the
/// form `return;` is used in a method whose declared return type cannot be
/// assigned to `void`.
/// @Issue 42459
/// @author rodionov

class C {
  static C staticMethod() {
    return;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  int instanceMethod() {
    return;
//  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(C);
}
