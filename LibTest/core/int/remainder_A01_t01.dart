/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num remainder(num other)
 * Returns remainder left by division.
 * @description Checks that this method returns correct value for integer arguments.
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
 * @needsreview Undocumented
 * seems to work the same way as JS's operator%: the sign of remainder is the same as dividend's
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(0, 1.remainder(1));
  Expect.equals(0, 1.remainder(1));
  Expect.equals(1, 1.remainder(2));
  Expect.equals(1, 3.remainder(2));
  Expect.equals(1, 3.remainder(-2));
  Expect.equals(-2, (-17).remainder(3));
  Expect.equals(-2, (-17).remainder(-3));

  Expect.equals(2147483647, 2147483647.remainder(2147483648));
  Expect.equals(0, 2147483647.remainder(2147483647));
  Expect.equals(1, 2147483647.remainder(2147483646));

  Expect.equals(9223372036854775807, 9223372036854775807.remainder(9223372036854775808));
  Expect.equals(0, 9223372036854775807.remainder(9223372036854775807));
  Expect.equals(1, 9223372036854775807.remainder(9223372036854775806));

  Expect.equals(-18446744073709551617, (-18446744073709551617).remainder(18446744073709551618));
  Expect.equals(0, (-18446744073709551617).remainder(18446744073709551617));
  Expect.equals(-1, (-18446744073709551617).remainder(18446744073709551616));

  //2^100 % 3^50
  Expect.equals(691521709937297972926156, 1267650600228229401496703205376.remainder(717897987691852588770249));
  
}
