/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The function type (T1, ... Tn, {Tx1 x1, ..., Txk xk}) -> T is a subtype of the function
 * type (S1, ..., Sn, {Sy1 y1, ..., Sym ym }) -> S, if all of the following conditions are met:
 * 1. Either S is void, or T <=> S.
 * 2. For all i 1 <= i <= n, Ti <=> Si.
 * 3. k >= m and yi belongs to {x1, ..., xk} for each i in 1..m.
 * 4. For all y in {y1, ..., ym}, yi = xj  =>  Tj <=> Si
 * @description Checks that function type t1 is not a subtype of function type t2 if its
 * named optional parameters are a smaller subset of t2's.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

typedef t1({int x});
typedef t2({int x, int y});
typedef t3({int x, int y, int z});

main() {
  Expect.isFalse(() {} is t1);

  Expect.isFalse(({int x}) {} is t2);
  Expect.isFalse(({var x}) {} is t2);

  Expect.isFalse(({int x, int y}) {} is t3);
  Expect.isFalse(({var x, var y}) {} is t3);
}
