// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
///
/// @description Checks
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

@AddTypeMacro()
library;

import 'macros_lib.dart';

main() {
  print(DefaultTypeMacroAddedClass);
}
