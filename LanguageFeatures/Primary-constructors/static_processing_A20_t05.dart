// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of the primary constructor is found in the
/// following steps, where `D` is the class, mixin class, extension type, or
/// enum declaration in the program that includes a primary constructor `k`, and
/// `D2` is the result of the derivation of the semantics of `D`. The derivation
/// step will delete elements that amount to the primary constructor.
/// Semantically, it will add a new constructor `k2`, and it will add zero or
/// more instance variable declarations.
/// ...
/// The formal parameter list `L2` of `k2` is identical to `L`, except that each
/// formal parameter is processed as follows.
/// ...
/// A formal parameter which is not covered by the previous two cases and which
/// does not have the modifier `var` or the modifier `final` is copied unchanged
/// from `L` to `L2` (this is a plain, non-declaring parameter).
///
/// @description Check that it is a static warning if an optional parameter of a
/// primary constructor with a private name is never used.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import '../../Utils/expect.dart';

class C1._([int? v]);
//               ^
// [analyzer] STATIC_WARNING.UNUSED_ELEMENT_PARAMETER

class C2._({int? v});
//               ^
// [analyzer] STATIC_WARNING.UNUSED_ELEMENT_PARAMETER

enum E1._([int? v]) {
//              ^
// [analyzer] STATIC_WARNING.UNUSED_ELEMENT_PARAMETER
  e0._();
}

enum E2._({int? v}) {
//              ^
// [analyzer] STATIC_WARNING.UNUSED_ELEMENT_PARAMETER
  e0._();
}

extension type ET1._([int? v]);
//                         ^
// [analyzer] STATIC_WARNING.UNUSED_ELEMENT_PARAMETER

extension type ET2._({int? v});
//                         ^
// [analyzer] STATIC_WARNING.UNUSED_ELEMENT_PARAMETER

main() {
  print(C1);
  print(C2);
  print(E1);
  print(E2);
  print(ET1);
  print(ET2);
}
