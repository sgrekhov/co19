// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If e1 translates to F then e1[e2] = e3 translates to:
///  PASSTHRU[F, fn[x] => x[EXP(e2)] = EXP(e3)]
///
///  The other assignment operators are handled equivalently.
///
/// @description Check that if e1 translates to F then e1[e2] ??= e3 translates
/// to: PASSTHRU[F, fn[x] => x[EXP(e2)] ??= EXP(e3)]
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class C {
  List<int?> _list = [3, 1, 4, null];
  int? operator[](int index) => _list[index];
  void operator[]=(int index, dynamic value) => _list[index] = value;
}

main() {
  C? c1 = new C();
  if (c1 != null) {
    Expect.equals(3, c1[0] ??= 42);
    Expect.equals(42, c1[3] ??= 42);
  }

  C c2 = new C();
  Expect.equals(3, c2[0] ??= 42);
  Expect.equals(42, c2[3] ??= 42);
}
