// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let D be a mixin application class declaration of the form
/// abstract? class N = S with M1, ..., Mn implements I1, ..., Ik;
/// ...
/// The effect of D in library L is to introduce the name N into the scope of L,
/// bound to the class defined by the clause S with M1, ..., Mn with name N,
/// as described below. If k > 0 then the class also implements I1, . . . , Ik.
///
/// @description Checks that if the mixin application declares interfaces then
/// the resulting class implements those interfaces. Interface implementation is
/// declared in a mixin
/// @author sgrekhov@unipro.ru

abstract class I {
  num get g;
}

class S {
}

mixin class M {
  num get g => 0;
}

class C = S with M implements I;

main() {
  C c = new C();
  c.g;
}