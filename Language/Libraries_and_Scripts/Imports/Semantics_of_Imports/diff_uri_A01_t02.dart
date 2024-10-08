// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All imports and exports of the same URI in a Dart program denotes
/// the same library, and imports or exports of different URIs denote distinct
/// libraries.
///
/// @description Checks that imports of the same URI in a Dart program denotes
/// the same library.
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';
import 'diff_uri_lib1.dart' as l1;
import 'diff_uri_lib2.dart' as l2;

main() {
  Expect.equals(0, l1.lib1Increment);
  Expect.equals(1, l1.lib1Counter);
  Expect.equals(0, l2.lib2Increment);
  Expect.equals(1, l2.lib2Counter);
}
