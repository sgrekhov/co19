// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Evaluation of e proceeds as follows:
/// First, if e is of the form
/// const T.id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k) then let i be the
/// value of the expression new T.id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k).
/// Otherwise, e must be of the form
/// const T(a1, ..., an, xn+1: an+1, ..., xn+k: an+k), in which case let i be
/// the result of evaluating new T(a1, ..., an, xn+1: an+1, ..., xn+k: an+k).
/// Then:
/// • If during execution of the program, a constant object expression has
///   already evaluated to an instance j of class R with type arguments Vi,
///   1 <= i <= m, then:
///   – For each instance variable f of i, let vif be the value of the field f
///     in i, and let vjf be the value of the field f in j.
///     If identical(vif, vjf ) for all fields f in i, then the value of e is j,
///     otherwise the value of e is i.
/// • Otherwise the value of e is i.
/// In other words, constant objects are canonicalized.
/// @description Checks that result of an expression of the form
/// T(a1, ..., an, xn+1: an+1, ..., xn+k: an+k) is an instance of T.
/// @author msyabro

import '../../../../Utils/expect.dart';

class A {
  const A();
}

class B {
  const B(p1);
}

class C {
  const C({p1, p2});
}

class D {
  const D(p1, [p2]);
}

main() {
  Expect.isTrue(const A() is A);
  Expect.isTrue(const B(0) is B);
  Expect.isTrue(const C(p2: true, p1: "") is C);
  Expect.isTrue(const D(0, 0) is D);
}
