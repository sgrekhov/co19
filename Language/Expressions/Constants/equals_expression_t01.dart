/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  An expression of one of the forms e1 == e2 or e1 != e2 where e1 and
 * e2 are constant expressions that evaluate to a numeric, string or boolean
 * value or to null is constant expression.
 * @description Checks that various expressions of the specified forms can be elements
 * of a constant list literal and are, therefore, constant expressions.
 * @author iefremov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

final constList = const [
  1 == 2,
  true != false,
  (true != 1),
  ((1 == 2) != ("" == "b")) == (false != true),
  null == null,
];

main() {
  Expect.isTrue(constList is List);
}
