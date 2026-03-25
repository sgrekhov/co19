// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Optional parameters may be specified and provided with default
/// values.
/// defaultFormalParameter:
///   normalFormalParameter ('=' expression)?
/// ;
/// defaultNamedParameter:
///   normalFormalParameter (':' expression)?
/// ;
/// @description Checks that the `:` character in an optional named parameter
/// declaration is a syntax error.
/// @author rodionov

f({int x: 0}) {}
//      ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(f);
}
