// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Redirecting generative constructors
/// ...
/// It is a compile-time error if:
/// ...
/// - The augmented constructor has a body.
///
/// @description Checks that it is a compile-time error to declare an augmenting
/// redirecting generative constructor if an introductory constructor has a body
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A18_t06.dart';

augment class C {
  augment C.foo() : this();
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment ET.foo(int x) : this(x);
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
}
