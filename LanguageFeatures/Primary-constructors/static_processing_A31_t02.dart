// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Moreover, for every constant expression which is an instance
/// creation that invokes a constructor of `D`, a compile-time error occurs if
/// the result of substituting actual arguments of the constructor invocation
/// into one of the above mentioned initializing expressions or initializer list
/// elements yields an expression which is not constant.
///
/// @description Check that it is a static warning to tear off a primary
/// constructor which has parameter with `@mustBeConst` annotation.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

import 'package:meta/meta.dart';

class C1(@mustBeConst int v); // ignore: experimental_member_use

class C2([@mustBeConst int v = 0]); // ignore: experimental_member_use

class C3({@mustBeConst int v = 0}); // ignore: experimental_member_use

class C4({@mustBeConst required int v}); // ignore: experimental_member_use

extension type ET1(@mustBeConst int v); // ignore: experimental_member_use

extension type ET2([@mustBeConst int v = 0]); // ignore: experimental_member_use

extension type ET3({@mustBeConst int v = 0}); // ignore: experimental_member_use

extension type ET4({@mustBeConst required int v}); // ignore: experimental_member_use

main() {
  print(C1.new);
//      ^^^^^^
// [analyzer] STATIC_WARNING.TEAROFF_WITH_MUST_BE_CONST_PARAMETER

  print(C2.new);
//      ^^^^^^
// [analyzer] STATIC_WARNING.TEAROFF_WITH_MUST_BE_CONST_PARAMETER

  print(C3.new);
//      ^^^^^^
// [analyzer] STATIC_WARNING.TEAROFF_WITH_MUST_BE_CONST_PARAMETER

  print(C4.new);
//      ^^^^^^
// [analyzer] STATIC_WARNING.TEAROFF_WITH_MUST_BE_CONST_PARAMETER

  print(ET1.new);
//      ^^^^^^^
// [analyzer] STATIC_WARNING.TEAROFF_WITH_MUST_BE_CONST_PARAMETER

  print(ET2.new);
//      ^^^^^^^
// [analyzer] STATIC_WARNING.TEAROFF_WITH_MUST_BE_CONST_PARAMETER

  print(ET3.new);
//      ^^^^^^^
// [analyzer] STATIC_WARNING.TEAROFF_WITH_MUST_BE_CONST_PARAMETER

  print(ET4.new);
//      ^^^^^^^
// [analyzer] STATIC_WARNING.TEAROFF_WITH_MUST_BE_CONST_PARAMETER
}
