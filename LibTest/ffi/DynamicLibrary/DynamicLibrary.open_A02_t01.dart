// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion DynamicLibrary.open(String name)
///  Loads a dynamic library file with local visibility.
///
///  Throws an ArgumentError if loading the dynamic library fails.
///
///  Calling this function multiple times, even in different isolates, returns
///  objects which are equal but not identical. The underlying library is only
///  loaded once into the DartVM by the OS.
///
/// @description Checks that an ArgumentError if loading the dynamic library
/// fails
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "../ffi_utils.dart";
import "../../../Utils/expect.dart";

void main() {
  Expect.throws(() {
    new DynamicLibrary.open("Wrong path");
  }, (e) => e is ArgumentError);
}
