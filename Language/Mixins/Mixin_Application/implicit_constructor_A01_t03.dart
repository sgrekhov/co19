// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For each generative constructor of the form
/// Sq(T1 a1, . . ., Tk ak)
/// of S that is accessible to LC, C has an implicitly declared constructor of
/// the form
/// Cq(T1 a1, ..., Tk ak): superq(a1, . . ., ak);
/// where Cq is obtained from Sq by replacing occurrences of SN, which denote
/// the superclass, by N, and superq is obtained from Sq by replacing
/// occurrences of SN which denote the superclass by super.
///
/// @description Checks that for each generative constructor of the form
/// Sq(T1 a1, . . ., Tk ak) a mixin application declares constructor of the form
/// Cq(T1 a1, ..., Tk ak): superq(a1, . . ., ak);. Test type aliases
/// @author sgrekhov@unipro.ru

import "../../../Utils/expect.dart";

class A {
  bool v1;
  num v2;
  A(bool this.v1, num this.v2);
}

typedef AAlias = A;

mixin class M1 {
}

class C = AAlias with M1;

main() {
  C c = new C(true, 2);
  Expect.equals(true, c.v1);
  Expect.equals(2, c.v2);
}