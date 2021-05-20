// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion "if" is a reserved word.
/// A reserved word may not be used as an identifier;  it is a compile-time error
/// if a reserved word is used where an identifier is expected.
/// @description Checks that it is a compile-time error when a reserved word "if"
/// is used as a class name.
/// @author vasya


class if { } // error
//    ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  null is if;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}
