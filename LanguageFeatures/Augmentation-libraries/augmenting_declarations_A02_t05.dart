// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For the following, we’ll say that one declaration of a library is
/// above another declaration of the same library if and only if:
/// - The former declaration is in the same file as the latter declaration, and
///   it is textually earlier in the file (“above” in the source code as
///   normally presented), or
/// - The former declaration is in a file that is a direct or transitive parent
///   file of the file of the latter declaration (“above” in the file tree
///   hierarchy).
/// We can similarly define below as the inverse of that relation. Both before
/// and after define strict partial orders on declarations in a library.
///
/// It’s a compile-time error if a library contains an augmentation declaration
/// and a corresponding non-augmentation base declaration, and the base
/// declaration is not above the augmentation declaration.
///
/// @description Checks that it is a compile-time error if a base declaration is
/// not above the augmentation declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment class C {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin M {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment enum E {e0;}
//           ^
// [analyzer] unspecified
// [cfe] unspecified

augment extension Ext {}
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

augment extension type ET(int _) {}
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

augment typedef StringAlias = String;
//              ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment typedef void Foo();
//                   ^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {}

mixin M {}

enum E {e0;}

extension Ext {}

extension type ET(int _) {}

typedef StringAlias = String;

typedef void Foo();

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
  print(StringAlias);
  print(Foo);
}