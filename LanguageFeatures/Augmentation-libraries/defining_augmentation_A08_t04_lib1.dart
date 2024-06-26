// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - An export or import (not import augment) refers to an entity which is not
///   a library
///
/// @description Checks that it is a compile-time error if an `export` refers to
/// an entity which is not a library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'defining_augmentation_A08_t04.dart';
