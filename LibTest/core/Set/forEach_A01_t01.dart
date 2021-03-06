/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(T element))
 * Applies the function [f] to each element of the collection.
 * @description Checks that forEach() browses every element of the set.
 * @author pagolubev
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";


main() {
  Set<int> s = new Set<int>();
  s.addAll([1, 2, 3, 4, 5]);

  List<int> a = new List(s.length);
  int i = 0;

  s.forEach((int x) {
    a[i] = x;
    i++;
  });

  for(int j = 0; j < a.length; j++) {
    Expect.isTrue(s.remove(a[j]));
  }
  Expect.isTrue(s.isEmpty);
}
