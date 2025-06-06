// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a variable `x` is promotable via type test with type
/// `T` given variable model `VM` if
/// - `VM = VariableModel(declared, promoted, tested, assigned, unassigned,
///     captured)`
/// - and `captured` is `false`
/// - and `S` is the current type of `x` in `VM`
/// - and not `S <: T`
/// - and `T <: S` or (`S` is `X extends R` and `T <: R`) or (`S` is `X & R` and
///   `T <: R`)
///
/// @description Checks that a variable cannot be promoted from `FutureOr<void>`
/// to `Future<void>` or `void`.
/// @author sgrekhov22@gmail.com
/// @issue 60718

import 'dart:async';
import '../../Utils/static_type_helper.dart';

typedef Void = void;

test1(FutureOr<void> s) {
  if (s is Future<void>) { // ignore: unnecessary_type_check
    s.expectStaticType<Exactly<Future<void>>>();
  } else {
    s.expectStaticType<Exactly<FutureOr<void>>>();
  }
}

test2(FutureOr<void> s) {
  if (s is Void) { // ignore: unnecessary_type_check
    s.expectStaticType<Exactly<FutureOr<void>>>();
  } else {
    s.expectStaticType<Exactly<FutureOr<void>>>();
  }
}

main() {
  test1(Future.value(0));
  test2(Future.value(0));
}
