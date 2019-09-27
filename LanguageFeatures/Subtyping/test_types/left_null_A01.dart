/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Null: T0 is Null.
 * @description Check that if type T0 is Null then T0 is a subtype of a type T1.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
class T1 {
  const T1();
}

Null t0Instance = null;
T1? t1Instance = new T1();

const t1Default = const T1();

//# @T0 = Null
//# @T1 = T1?
