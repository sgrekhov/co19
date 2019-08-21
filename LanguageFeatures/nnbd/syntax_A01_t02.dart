/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The grammar of types is extended to allow any type to be suffixed
 * with a ? (e.g. int?) indicating the nullable version of that type.
 *
 * @description Check that any type can be suffixed with a ? indicating the
 * nullable version of that type. Test top-level types
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

dynamic? foo(dynamic? d) => d;

void? bar(void? v) => v;

Null? test(Null? n) => n;

main() {
  dynamic? d = null;
  d = foo(d);

  void? v = null;
  v = bar(v);

  Null? n = null;
  n = test(n);
}
