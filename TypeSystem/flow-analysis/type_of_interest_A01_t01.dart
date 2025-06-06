// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that at type `T` is a type of interest for a variable `x`
/// in a set of tested types `tested` if `tested` contains a type `S` such that
/// `T` is `S`, or `T` is `NonNull(S)`.
///
/// @description Checks that `x is T` makes `T` a type of interest for `x`.
/// @author sgrekhov22@gmail.com
/// @issue 60479

class S {}

class T extends S {
  int foo() => 42;
}

main() {
  S x = S();
  x is T;  // make `T` a type of interest
  x = T();
  x.foo();
}
