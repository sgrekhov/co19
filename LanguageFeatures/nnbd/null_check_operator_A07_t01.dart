// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An expression of the form e! evaluates e to a value v, throws a
/// runtime error if v is null, and otherwise evaluates to v.
///
/// @description Check that an expression of the form e! evaluates e to a value
/// v, throws no runtime error if v is not null. Test (true)
/// @author sgrekhov@unipro.ru
/// @issue 39723

main() {
  true!;
//    ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  true!.toString();
//    ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  true!?.toString();
//    ^^^
// [analyzer] unspecified
  true.toString()!;
//               ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
}
