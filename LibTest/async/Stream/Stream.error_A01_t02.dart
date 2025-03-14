// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion @Since("2.5")
///   Stream<T>.error( Object error, [ StackTrace? stackTrace ])
///
/// Creates a stream which emits a single error event before completing.
///
/// This stream emits a single error event of `error` and `stackTrace` and then
/// completes with a done event.
///
/// @description Checks that if `stackTrace` is specified it is available when a
/// `catch` clause is executed to catch the error.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() async {
  StackTrace stackTrace = StackTrace.fromString("My StackTrace");
  Stream stream = Stream.error("Stream.error", stackTrace);
  try {
    var v = await stream.first;
    Expect.fail("Unexpected event $v");
  } catch (e, st) {
    Expect.equals("My StackTrace", st.toString());
  }
}
