/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A parenthesized expression (e) where e is a constant expression
 * is a constant expression.
 * @description Checks that a parenthesized constant expression can be an element
 * of a constant list literal and is, therefore, a constant expression.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

const x = '';
const bool y = false;

class C {
  const C();
}

const constList = const [
  (1),
  (true),
  (''),
  (null),
  (x),
  (y),
  (const C()),
  (const [1, 2, 3]),
  (const {}),
  (1 == 1),
  (identical('', null)),
  (true != false),
  (!true),
  (false && false),
  (1 ^ 2),
  (~0),
  (2 + 0.5),
  (1 * 1)
];

main() {
  Expect.isTrue(constList is List);
}
