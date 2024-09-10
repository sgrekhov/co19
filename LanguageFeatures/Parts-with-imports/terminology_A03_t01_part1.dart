// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s a compile-time error if a `part` directive denotes a file
/// which is not a part file.
///
/// @description Check that it is a compile-time error if a `part` directive
/// denotes a file which is not a part file.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'terminology_A03_t01.dart';

part 'terminology_A03_t01_part2.dart';
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
