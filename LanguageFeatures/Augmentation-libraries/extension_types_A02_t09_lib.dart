// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmentation can add a body to an extension type's implicit
/// constructor, which isn't otherwise possible. This is done by augmenting the
/// constructor in the body of the extension type.
///
/// @description Checks that that it is a compile-time error if an augmentation
/// of an extension type's implicit constructor is a `factory` constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'extension_types_A02_t09.dart';

augment extension type ET {
  augment factory ET(int id) => ET.foo(id);
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
}
