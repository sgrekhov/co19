/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a function literal of the form
 * (T1 a1, ..., Tn an, [Tn+1  xn+1 = d1, ..., Tn+k xn+k = dk]) {s} is
 * (T1, ..., Tn, [Tn+1 xn+1, .., Tn+k xn+k]) -> dynamic.
 * In any case where Ti ,1 <= i <= n is not specified,
 * it is considered to have been specified as dynamic.
 * @description Checks that a static type warning occurs when assigning a function literal
 * of the form (T1 a1, ..., Tn an, [Tn+1  xn+1 = d1,... Tn+k xn+k = dk]){s}
 * to a variable of a function type with incompatible parameter types.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */

import '../../../Utils/dynamic_check.dart';

typedef int foo(int x, String y, [double a, double b]);

main() {
  foo f;
  checkTypeError(() {
    f = (int x, int y, [double a, double b]) {};  /// static type warning
  });
}
