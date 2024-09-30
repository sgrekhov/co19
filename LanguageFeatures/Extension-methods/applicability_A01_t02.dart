// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension `E` is applicable to a simple or composite member
/// invocation with corresponding member basename m and target expression `e`,
/// where `e` has static type `S`, if
/// ...
/// - The type S does not have a member with the basename m. For this, the type
///   `dynamic` is considered as having all member names, and an expression of
///   type `Never` or `void` cannot occur as the target of a member invocation,
///   so none of these can ever have applicable extensions. Function types and
///   the type `Function` are considered as having a `call` member. This ensure
///   that if there is an applicable extension, the existing invocation would
///   otherwise be a compile-time error. Members of `Object` exists on all
///   types, so they can never be the target of implicit member invocations
///   (they can also not be declared as extension members).
///
/// @description Check that an extension member with the basename `m` is not
/// applicable if on type has a static member with the same basename.
/// @author sgrekhov22@gmail.com

class C {
  static String get m1 => "m1";
  static String m2() => "m2";
  static void set m3(String _) {}
}

extension Ext on C {
  void set m1(String _) {}
  void set m2(String _) {}
  String m3() => "Ext.m2";
}

main() {
  print(C().m1);
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

  print(C().m2());
//          ^^
// [analyzer] unspecified
// [cfe] unspecified

  C().m3 = "";
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}
