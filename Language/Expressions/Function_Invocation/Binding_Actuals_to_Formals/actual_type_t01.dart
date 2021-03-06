/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In checked mode, it is a dynamic type error if oi is not null and
 * the actual type of pi is not a supertype of the type of oi, i from 1 to m.
 * @description Checks that it is a dynamic type error when an actual argument is not
 * null and its actual type (bool) is not a subtype of the corresponding
 * positional parameter's type (int).
 * @author msyabro
 * @reviewer rodionov
 */

import '../../../../Utils/dynamic_check.dart';

func(int p1, int p2, int p3) {}

main() {
  var thirdParam = true;
  checkTypeError( () {
    func(1, 2, thirdParam);
  });
}
