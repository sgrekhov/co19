// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool get isDefinedAndNotNull
///
/// @description Checks that this getter returns `true` if  this value is
/// defined (not `undefined`) and not `Null`. `false` otherwise.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

main() {
  eval(r'''
    var n = null;
    var u = undefined;
    var s = "s";
  ''');

  Expect.isFalse(globalContext["n"].isDefinedAndNotNull);
  Expect.isTrue(42.toJS.isDefinedAndNotNull);
  Expect.isFalse(globalContext["u"].isDefinedAndNotNull);
  Expect.isTrue(globalContext["s"].isDefinedAndNotNull);
  Expect.isFalse(null.isDefinedAndNotNull);
}
