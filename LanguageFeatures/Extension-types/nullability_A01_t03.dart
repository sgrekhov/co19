// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let V be an extension type of the form Name<T1, .. Ts>, and let R
/// be the corresponding instantiated representation type. If R is non-nullable
/// then V is a proper subtype of Object, and V is non-nullable. Otherwise, V is
/// a proper subtype of Object?, and V is potentially nullable.
///
/// @description Checks that null can be assigned to an extension type at run
/// time if its representation type is nullable
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "dart:async" show FutureOr;
import "../../Utils/expect.dart";

typedef VoidAlias = void;

extension type ET1<T extends int?>(T _) {}

extension type ET2<T extends Null>(T _) {}

extension type ET3<T extends dynamic>(T _) {}

extension type ET4<T extends FutureOr<Null>>(T _) {}

extension type ET5<T extends VoidAlias>(T _) {}

main() {
  ET1 et1 = null as dynamic;
  Expect.isNull(et1);
  ET2 et2 = null as dynamic;
  Expect.isNull(et2);
  ET3 et3 = null as dynamic;
  Expect.isNull(et3);
  ET4 et4 = null as dynamic;
  Expect.isNull(et4);
  ET5 et5 = null as dynamic;
  Expect.isNull(et5);
}