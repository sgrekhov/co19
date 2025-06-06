// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The flatten function is modified as follows:
///
/// [flatten(T)] is defined by cases on [T]:
///
///   if [T] is [S?] then [flatten(T) = flatten(S)?]
///   otherwise if [T] is [S*] then [flatten(T) = flatten(S)*]
///   otherwise if [T] is [FutureOr<S>] then [flatten(T) = S]
///   otherwise [if T <: Future] then let [S] be a type such that [T <:
///       Future<S>] and for all [R], if [T <: Future<R>] then [S <: R]; then
///       [flatten(T) = S]
///   otherwise [flatten(T) = T]
///
/// @description Check that future flattening works correctly for nullable
/// [Future<int?>] and Future<Object?> types and the expression can be non-null.
/// @author iarkh@unipro.ru
/// Issue 41437

import "dart:async";
import "../../Utils/expect.dart";

main() {
  asyncStart(4);
  Future<int?>(() => 1).then((value) => asyncEnd());

  Future<Future<int?>>(() => Future<int?>(() => 1)).then((value) {
    value.then((value1) => asyncEnd());
  });

  Future<Object?>(() => 1).then((value) => asyncEnd());

  Future<Future<Object?>>(() => Future<Object?>(() => 1)).then((value) {
    value.then((value1) => asyncEnd());
  });
}
