// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion We extend the list grammar to allow spread elements in addition to
/// regular elements:
/// listLiteral:
///   const? typeArguments? '[' spreadableList? ']'
///   ;
///
///   spreadableList:
///   spreadableExpression ( ',' spreadableExpression )* ','?
///   ;
///
///   spreadableExpression:
///   expression |
///   spread
///   ;
///
///   spread:
///   ( '...' | '...?' ) expression
///   ;
///
/// Instead of [expressionList], this uses a new [spreadableList] rule since
/// [expressionList] is used elsewhere in the grammar where spreads aren't
/// allowed. Each element in a list is either a normal expression or a spread
/// element. If the spread element starts with [...?], it's a null-aware spread
/// element.
/// @description Checks spread element syntax
/// @author iarkh@unipro.ru


main() {
  Map m1 = {...{?m1}};    //# 01: syntax error
}