// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Finally, we need to address situations involving implicit usage
/// of an object whose static type can be `void`. ... It is a compile-time error
/// for an asynchronous for-in statement to have a stream expression of type `T`
/// such that `Stream<void>` is the most specific instantiation of `Stream` that
/// is a superinterface of `T`, unless the iteration variable has type `void`.
///
/// @description Checks that it is not an error if in an asynchronous for-in
/// loop type of the iterator expression is `Stream<void>` and the type of the
/// iteration variable is `void`.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

void main() async {
  Stream<void> stream = Stream<void>.fromIterable([1, 2, 3]);
  int j = 0;
  await for (void i in stream) {
    Expect.equals(++j, i as int);
  }
  j = 0;
  await for (var i in stream) {
    Expect.equals(++j, i as int);
  }
}
