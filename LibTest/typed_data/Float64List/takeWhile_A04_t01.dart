/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Iterable<E> skipWhile(bool test(E element))
 * When the iterator encounters an element e that does not satisfy test,
 * it discards e and moves into the finished state.
 * That is, it will not ask or provide any more elements.
 * @description Checks that once an element does not satisfy
 * the [test] every later element is skipped.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var list = new Float64List.fromList([1.0, 1.0, 2.0, 1.0, 1.0, 1.0]);
  var res = list.takeWhile((e) => e == 1.0);
  Expect.equals(2, res.length);
  for(int i = 1; i < 2; ++i) {
    Expect.equals(1.0, res.elementAt(i));
  }
}
