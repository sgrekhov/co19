// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - There is a cycle in the graph whose edges are the part
///   directives of an augmented library and of any augmentation libraries which
///   are directly or indirectly reachable from there via said edges.
///
/// @description Checks that it is a compile-time error if a library tries to
/// augment itself. Test cycling dependency
/// @author sgrekhov22@gmail.com
/// @issue 55168, 55169

// SharedOptions=--enable-experiment=macros

part of 'defining_augmentation_A05_t02_lib.dart';
//               ^
// [analyzer] unspecified
// [cfe] unspecified

part 'defining_augmentation_A05_t02_lib.dart';
//              ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
