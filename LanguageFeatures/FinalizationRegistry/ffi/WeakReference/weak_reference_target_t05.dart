// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion target property
/// T? target
/// The current object weakly referenced by this, if any.
///
/// The value is either the object supplied in the constructor, or null if the
/// weak reference has been cleared.
///
/// @description Check that the value of this property value is either the
/// object supplied in the constructor, or null if the weak reference has been
/// cleared
/// @author sgrekhov@unipro.ru

import "dart:async";
import "../../gc_utils_lib.dart";
import "../../../../Utils/expect.dart";

class C {
  int id;
  C(this.id);

  String toString() => "C($id)";
}

main() async {
  C? c1 = C(42);
  WeakReference<C> wr = WeakReference(c1);
  asyncStart();
  Future<C?>.delayed(Duration(milliseconds: 1), () => c1).then((C? c2) async {
    Expect.isNotNull(wr.target);
    Expect.equals(c1, wr.target);
    triggerGc();
    await Future.delayed(Duration(seconds: 1));
    Expect.isNotNull(wr.target);
    c2 = null;
    triggerGc();
    Expect.isNull(wr.target);
    asyncEnd();
  });
  await Future.delayed(Duration(milliseconds: 10));
  Expect.isNotNull(wr.target);
  Expect.equals(c1, wr.target);
  c1 = null;
  triggerGc();
  Expect.isNotNull(wr.target);
}