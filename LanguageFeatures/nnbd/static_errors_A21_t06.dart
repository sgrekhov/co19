// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error for a variable to be declared as late in any of the
/// following positions: in a formal parameter list of any kind; in a catch
/// clause; in the variable binding section of a c-style for loop, a for in loop,
/// an await for loop, or a for element in a collection literal.
///
/// @description Check that it is an error if variable declared late in await for
/// loop
/// @author sgrekhov@unipro.ru

import "dart:async";

main() async {
  Stream stream = new Stream.empty();
  await for (late var i in stream) {
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
