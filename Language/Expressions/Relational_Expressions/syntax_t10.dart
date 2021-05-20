// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Relational expressions invoke the relational operators on objects.
/// relationalExpression:
///   bitwiseOrExpression (typeTest | typeCast | relationalOperator
/// bitwiseOrExpression)? |
///   super relationalOperator bitwiseOrExpression
/// ;
/// relationalOperator:
///   '>=' |
///   '>' |
///   '<=' |
///   '<'
/// ;
/// A relational expression is either a bitwise expression, or an invocation of
/// a relational operator on either super or an expression e1, with argument e2.
/// @description Checks that a relational expression cannot be the operand of
/// another relational expression.
/// @author msyabro


main() {
  1 < 2 < 3;
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}
