// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A redirecting factory constructor marked `augment` adds its
/// factory redirection to the augmented constructor.
///
/// The result of applying the augmenting constructor is a redirecting factory
/// constructor with the same target constructor designation as the augmenting
/// constructor. This removes the potentially non-redirecting property of the
/// constructor.
///
/// @description Checks that it is not an error if an introductory constructor
/// already has a redirection.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_constructors_A19_t03_lib.dart';

class C {
  int x, y;
  C(this.x, [this.y = 0]);
  C.foo(this.x, {this.y = 0});
  factory C.bar(int x, [int y]) = C;
  factory C.baz(int x, {int y}) = C.foo;
  factory C.qux(int x, [int y]) = D;
}

class D extends C {
  D(super.x, [super.y = 1]);
  D.foo(int x, {int y = 1}): super(x, y);
}

main() {
  Expect.equals(1, C.bar(1).x);
  Expect.equals(1, C.bar(1).y);
  Expect.equals(1, C.bar(1, 2).x);
  Expect.equals(2, C.bar(1, 2).y);

  Expect.equals(1, C.baz(1).x);
  Expect.equals(1, C.baz(1).y);
  Expect.equals(1, C.baz(1, y: 2).x);
  Expect.equals(2, C.baz(1, y: 2).y);

  Expect.equals(1, C.qux(1).x);
  Expect.equals(0, C.qux(1).y);
  Expect.equals(1, C.qux(1, 2).x);
  Expect.equals(2, C.qux(1, 2).y);
}
