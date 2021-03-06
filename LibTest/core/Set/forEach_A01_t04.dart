/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(T element))
 * Applies the function [f] to each element of the collection.
 * @description Checks that nested invocations of forEach() do not cause any errors.
 * @author pagolubev
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";


main() {
  Set<int> s = new Set<int>();
  s.addAll([1, -3, 10, 17]);

  Set<int> outer = new Set<int>();
  s.forEach((int x) {
    outer.add(x);
    Set<int> inner = new Set<int>();
    s.forEach((int y) {
      inner.add(y);
    });
    Expect.isTrue(inner.containsAll(s));
  });
  Expect.isTrue(outer.containsAll(s));
}
