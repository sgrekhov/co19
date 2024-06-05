// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion As we do for other null-aware expressions like `?.` and `...?`,
/// compilers and IDEs should probably warn if the inner expressions in
/// null-aware elements are not potentially nullable since in that case, the `?`
/// has no meaningful effect.
///
/// @description Check that it is a warning if the inner expressions in
/// null-aware elements are not potentially nullable.
/// @author sgrekhov22@gmail.com

main() {
  int e1 = 42;
  int? e2 = 2 > 1 ? 2 : null;
  int? e3 = 2 > 1 ? 3 : null;
  int? e4 = 2 > 1 ? 4 : null;

  if (e4 != null) {
    var set = {
      ?e1,
//    ^
// [analyzer] unspecified
// [cfe] unspecified
      ?e2!,
//    ^
// [analyzer] unspecified
// [cfe] unspecified
      if (e3 != null)
        ?e3
//      ^
// [analyzer] unspecified
// [cfe] unspecified
      else
        ?e3, // Ok
      ?e4
//    ^
// [analyzer] unspecified
// [cfe] unspecified
    };

    var list = [
        ?e1,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
        ?e2!,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
        if (e3 != null)
          ?e3
//        ^
// [analyzer] unspecified
// [cfe] unspecified
        else
          ?e3, // Ok
        ?e4
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    ];

    var map1 = {
        ?e1: 1,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
        ?e2!: 2,
//      ^
// [analyzer] unspecified
// [cfe] unspecified
        if (e3 != null)
          ?e3: 3
//        ^
// [analyzer] unspecified
// [cfe] unspecified
        else
          ?e3: 3, // Ok
        ?e4: 4
//      ^
// [analyzer] unspecified
// [cfe] unspecified
    };

    var map2 = {
      1: ?e1,
//       ^
// [analyzer] unspecified
// [cfe] unspecified
      2: ?e2!,
//       ^
// [analyzer] unspecified
// [cfe] unspecified
      if (e3 != null)
        3: ?e3
//         ^
// [analyzer] unspecified
// [cfe] unspecified
      else
        3: ?e3, // Ok
      4: ?e4
//       ^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}
