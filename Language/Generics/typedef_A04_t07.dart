// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A generic type alias is a declaration [D] of one of the following
/// forms:
///   m typedef id<X1 extends B1, . . . , Xs extends Bs> = T;
///   ...
/// [D] introduces a mapping from actual type argument lists to types.
/// @description Checks that [D] maps argument list to types when [T] represents
/// some function
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class X {}
class Y extends X {}

T checkme1<T>(T t) { throw "Should not be here"; }
X checkme2<T extends X>(X x) { throw "Should not be here"; }
Y checkme3<T extends Y>(Y y) { throw "Should not be here"; }

typedef Func1<T> = T1 Function<T1 extends T>(T1 t);
typedef Func2<T extends X> = T Function<T1 extends T>(T t);
typedef Func3<T extends Y> = T Function<T1 extends T>(T t);

main() {
  Expect.isTrue(checkme1 is Func1);
  Expect.isFalse(checkme1 is Func2);
  Expect.isFalse(checkme1 is Func3);
  checkType(checkIs<Func1>, true, checkme1);
  checkType(checkIs<Func2>, false, checkme1);
  checkType(checkIs<Func3>, false, checkme1);

  Expect.isFalse(checkme2 is Func1);
  Expect.isTrue(checkme2 is Func2);
  Expect.isFalse(checkme2 is Func3);
  checkType(checkIs<Func1>, false, checkme2);
  checkType(checkIs<Func2>, true, checkme2);
  checkType(checkIs<Func3>, false, checkme2);

  Expect.isFalse(checkme3 is Func1);
  Expect.isFalse(checkme3 is Func2);
  Expect.isTrue(checkme3 is Func3);
  Expect.isTrue(checkme3 is Func2<Y>);
  checkType(checkIs<Func1>, false, checkme3);
  checkType(checkIs<Func2>, false, checkme3);
  checkType(checkIs<Func3>, true, checkme3);
  checkType(checkIs<Func2<Y>>, true, checkme3);
}
