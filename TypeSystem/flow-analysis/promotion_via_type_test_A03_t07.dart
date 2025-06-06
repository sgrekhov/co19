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
/// @description Checks that a variable is not promoted if `T` is a not a proper
/// subtype of `S`. Test type `Object?` as `T`.
/// @author sgrekhov22@gmail.com
/// @issue 60609, 60496, language#4368

import '../../Utils/static_type_helper.dart';

main() {
  dynamic d = "a";
  if (d is Object?) { // ignore: unnecessary_type_check
    if (1 > 2) {
      d.testDynamic;
    }
  }
}
