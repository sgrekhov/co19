// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion `assigned` is a boolean value indicating whether the variable has
/// definitely been assigned at the given point in the source code. When
/// `assigned` is true, we say that the variable is definitely assigned at that
/// point.
///
/// @description Checks that an assignment in the body of a do-while loop is a
/// definite assignment.
/// @author sgrekhov@unipro.ru

main() {
  int n;
  do {
    n = 42;
  } while (false);
  n;  // It's not an error to read local non-nullable variable when it is definitely assigned
}
