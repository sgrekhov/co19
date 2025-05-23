// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion operator!= If `N` is an expression of the form `E1 != E2`, it is
/// treated as equivalent to the expression `!(E1 == E2)`.
///
/// @description Checks that if an extension type which doesn't implement
/// `Object` is compared with the `null` literal, then a variable assigned in
/// any true or false branch is possibly assigned.
/// @author sgrekhov22@gmail.com
/// @issue 60114

extension type ET(num v) {}

test1() {
  late int i;
  late int j;
  ET et = ET(0);
  if (et != null) {
    i = 42;
  } else {
    j = 42;
  }
  i; // Possibly assigned
  j; // Possibly assigned
}

test2() {
  late int i;
  late int j;
  ET et = ET(0);
  if (null != et) {
    i = 42;
  } else {
    j = 42;
  }
  i;
  j;
}

main() {
  print(test1);
  print(test2);
}
