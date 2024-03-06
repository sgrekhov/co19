// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - A top-level declaration in an augmentation has the same name as a
///   declaration in the main library or another of its augmentations (unless it
///   is an augmenting declaration)
///
/// @description Checks that it is a compile-time error if a top-level
/// declaration in an augmentation has the same name as a declaration in the
/// main library. Test the case when an entry point (function `main()`) is in an
/// augmentation library
/// @author sgrekhov22@gmail.com
/// @issue 55113

// SharedOptions=--enable-experiment=macros

library augment 'defining_augmentation_A03_t02_main.dart';

class C {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

mixin M {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified

enum E {e;}
//   ^
// [analyzer] unspecified
// [cfe] unspecified

void foo() {}
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef void Foo();
//           ^^^
// [analyzer] unspecified
// [cfe] unspecified

typedef StringAlias = String;
//      ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

int get getter => 42;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

void set setter(int _) {}
//       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension Ext on List {}
//        ^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET(int _) {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

var x = 0;
//  ^
// [analyzer] unspecified
// [cfe] unspecified

const c = 0;
//    ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C);
  print(M);
  print(E);
  print(foo);
  print(Foo);
  print(StringAlias);
  print(getter);
  setter = 1;
  print(List);
  print(ET);
  print(x);
  print(c);
}
