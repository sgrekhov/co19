// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything.
///
/// @description Checks that no entry named `_` is introduced into the enclosing
/// scope by a wildcarded declaration. Test parameters of constructors.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class C<T> {
  C.constructor1(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  C.constructor2([int _ = 0]) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  C.constructor3(T _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  factory C.factoryConstructor1(int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return C();
  }
  factory C.factoryConstructor3(T _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return C();
  }
}

class D {
  final int x;

  const D(int _) : this.x = _;
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET<T>(int id) {
  ET.constructor1(this.id, int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  ET.constructor2(this.id, [int _ = 0]) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  ET.constructor3(this.id, T _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }

  factory ET.factoryConstructor1(int id, int _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return ET(id);
  }
  factory ET.factoryConstructor3(int id, T _) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    return ET(id);
  }
}

main() {
  print(C);
  print(D);
  print(ET);
}
