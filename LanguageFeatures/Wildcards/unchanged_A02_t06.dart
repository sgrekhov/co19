// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is a compile-time error to declare more than one
/// top-level setter named `_`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

void set _(int v) {}
void set _(int v) {}
//       ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
