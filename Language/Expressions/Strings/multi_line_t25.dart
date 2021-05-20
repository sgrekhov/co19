// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// stringLiteral:
///   (multilineString | singleLineString)+
/// ;
/// multilineString:
///   '"""' stringContentTDQ* '"""' |
///   ''''' stringContentTSQ* ''''' |
///   '"""'  (~ '"""')* '"""' |
///   ''''' (~ ''''')* '''''
/// ;
/// stringContentTDQ:
///   ~( '\' | '"""' | '$') |
///   stringInterpolation
/// ;
/// stringContenTSQ:
///   ~( '\' | ''''' | '$') |
///   stringInterpolation
/// ;
/// @description Checks that it is a compile-time error when a raw multi-line
/// double-quotes string literal has fewer than 3 opening quotes.
/// @author rodionov


main() {
//     ^
// [cfe] unspecified
// [error line 36, column 0]
// [analyzer] unspecified
// [cfe] unspecified
// [error line 37, column 0]
// [analyzer] unspecified
  r""foo""";
}