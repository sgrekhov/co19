// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - A non-redirecting constructor augments a constructor which is not
///   potentially non-redirecting.
///
/// @description Checks that it is a compile-time error if a non-redirecting
/// constructor augments a constructor which is not potentially non-redirecting.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_constructors_A07_t01.dart';

augment class C {
  augment C.foo(): x = 1, super(0);
}
