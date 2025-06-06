// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The potentially constant expressions and constant expressions are
/// the following:
/// ...
/// • An expression of the form `e?.length` is potentially constant if `e` is a
///   potentially constant expression. It is further constant if `e` is a
///   constant expression that evaluates to `null`, or it evaluates to an
///   instance of `String` and `length` denotes an instance getter invocation.
///
/// @description Checks that it is a compile-time error to use an expression
/// `e?.length` as a constant is `e` is not a constant expression.
/// @author sgrekhov22@gmail.com
/// @issue 59904

class C {
  const C();

  @override
  String toString() {
    return "Arbitrary code";
  }
}

const x = const C();
final y = 42;
final z = null;

const c1 = "$x"?.length; // "$x" is a potentially constant but not a constant
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

const c2 = y?.length;
//         ^
// [analyzer] unspecified
// [cfe] unspecified

const c3 = z?.length;
//         ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(c1);
  print(c2);
  print(c3);
}
