// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let C be a class. It is a compile-time error if C declares a
/// constructor named C.n and a static member with basename n.
/// @description Check that it is a compile-time error if C declares a
/// constructor named C.n and a static member with basename n
/// @author sgrekhov@unipro.ru

class C {
  C.s() {}
//  ^
// [analyzer] unspecified
// [cfe] unspecified

  static set s(var value) {}
  static void s() {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified
  static int s() => 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  static int get s => 1;
  static int s = 1;
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C.s();
}
