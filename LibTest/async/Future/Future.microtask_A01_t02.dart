/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Future.microtask(computation())
 * Creates a future containing the result of calling computation
 * asynchronously with scheduleMicrotask.
 * if the result of executing computation throws, the returned future is
 * completed with the error.
 * If the returned value is itself a Future, completion of the created
 * future will wait until the returned future completes, and will then
 * complete with the same result.
 * If a value is returned, it becomes the result of the created future.
 * @description Checks that if computation() throws, the created future
 * is completed with the same error.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var value = [1,2,3];

  asyncStart();
  Future future = new Future.microtask(() => throw value);
  
  future
    .catchError((e) {
      Expect.identical(value, e);
      asyncEnd();
    });
}
