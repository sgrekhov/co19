/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The effect of a static setter declaration in class C is to add
 * an instance setter with the same name and signature to the Type object for
 * class C that forwards to the static setter.
 * @description Check that static setter declaration adds instance setter with the same
 * name to the Type object of the class and this instance forwards to the static getter
 * @author sgrekhov@unipro.ru
 * @issue 23721
 */
import "../../../Utils/expect.dart";

class C {
  set s1 (int value) => s1 = value;

  static int _s2;
  static set s2 (int value) => _s2 = value;
  static int get s2 => _s2;
}

main() {
  C c = new C();
  Type t = c.runtimeType;

  Expect.throws(() {t.s1 = 1;}, (e) => e is NoSuchMethodError);

  t.s2 = 3;
  Expect.equals(3, t.s2, "Static setter should set expected value");
  Expect.equals(3, C.s2, "Static setter should be forwarded by instance " +
      "one added to the Type object");
}
