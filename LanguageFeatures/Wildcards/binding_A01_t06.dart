// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything.
///
/// @description Checks that no entry named `_` is introduced into the enclosing
/// scope by a wildcarded declaration. Test for-loop variables.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

test() async {
  await for (var _ in Stream.fromIterable([1, 2,3])) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  for (int _ = 0;;) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    break;
  }
  for (int _ = 0;;_++) {
//                ^
// [analyzer] unspecified
// [cfe] unspecified
    break;
  }
  for (int _ = 0;_ < 2;) {
//               ^
// [analyzer] unspecified
// [cfe] unspecified
    break;
  }
  for (var _ in [1, 2, 3]) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  test();
}
