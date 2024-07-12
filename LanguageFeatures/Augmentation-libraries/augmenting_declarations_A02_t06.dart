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

augment int variable = 0;
//          ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment final finalVariable = 0;
//            ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment late int lateVariable = 0;
//               ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment late final lateFinalVariable = 0;
//                 ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment external int externalVariable;
//                   ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment void function() {}
//           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment int get getter => 0;
//              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment void set setter(int _) {}
//               ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

int variable = 0;

final finalVariable = 0;

late int lateVariable = 0;

late final lateFinalVariable = 0;

external int externalVariable;

void function() {}

int get getter => 0;

void set setter(int _) {}

main() {
  print(variable);
  print(finalVariable);
  print(lateVariable);
  print(lateFinalVariable);
  print(function);
  print(getter);
  setter = 0;
}
