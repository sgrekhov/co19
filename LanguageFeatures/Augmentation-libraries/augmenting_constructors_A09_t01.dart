// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A non-redirecting generative constructor marked `augment` may:
/// - Add or replace the body of the augmented constructor with a new body.
///   - If the augmenting constructor has an explicit block body, then that body
///     replaces any existing constructor body.
///
/// @description Checks that if the augmenting constructor has an explicit block
/// body, then that body replaces any existing constructor body.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_constructors_A09_t01_lib.dart';

String _log = "";

class C1 {
  C1() {
    _log += "Original";
  }
}

class C2 {
  C2() {
    _log += "Original";
  }
}

class C3 {
  C3.new() {
    _log += "Original";
  }
}

extension type ET(int id) {
  ET.foo(this.id) {
    _log += "Original";
  }
}

main() {
  C1();
  Expect.equals("Augmented", _log);
  _log = "";
  C2();
  Expect.equals("Augmented", _log);
  _log = "";
  C3();
  Expect.equals("Augmented", _log);
  _log = "";
  ET(0);
  Expect.equals("Augmented", _log);
}
