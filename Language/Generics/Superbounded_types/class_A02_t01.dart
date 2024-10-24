// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a parameterized type `T` is
/// super-bounded when it is used in any of the following ways:
/// - `T` is an immediate subterm of a new expression or a constant object
///   expression.
///
/// @description Checks that it is a compile-time error if a super-bounded type
/// is an immediate subterm of a new expression.
/// @author iarkh@unipro.ru

class A<T extends A<T>> {}

main() {
  var a1 = new A<dynamic>();
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var a2 = new A<Object?>();
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var a3 = new A<void>();
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var a4 = new A<Null>();
//               ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var a6 = new A<A<dynamic>>();
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var a7 = new A<A<Object?>>();
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var a8 = new A<A<void>>();
//               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var a9 = new A<A<Null>>();
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
