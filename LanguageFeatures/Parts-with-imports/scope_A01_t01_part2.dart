// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion As usual, it’s a compile-time error if any import‘s target URI
/// does not resolve to a valid Dart library file.
///
/// @description Check that it is a compile-time error if an import‘s target
/// URI from a `part` file resolves to a not existing file.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'scope_A01_t01_part1.dart';

import 'not_existing.dart';
//     ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
