// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The special type `void` is used to indicate that the value of an
/// expression is meaningless and intended to be discarded.
///
/// @description Checks that using `void` as a declaration name is a syntax
/// error.
/// @author rodionov

void void() {}
//   ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void test() {
  var void;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  void();
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}
