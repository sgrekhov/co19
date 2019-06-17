/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call a method, setter, getter or operator on
 * an expression whose type is potentially nullable and not dynamic, except for
 * the methods, setters, getters, and operators on Object.
 * @description Check that it is no compile-time error to call a method, setter,
 * getter or operator on an expression whose type is potentially nullable if
 * they are  methods, setters, getters, and operators on Object
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "../../Utils/expect.dart";

class C {
}

test(C? c) {
  Expect.isNotNull(c.hashCode);
  Expect.isNotNull(c.toString());
  Expect.isNotNull(c.runtimeType);
  Expect.isFalse(c == new C());
}

main() {
  C? c = new C();
  Expect.isNotNull(c.hashCode);
  Expect.isNotNull(c.toString());
  Expect.isNotNull(c.runtimeType);
  Expect.isFalse(c == new C());

  test(null);
}