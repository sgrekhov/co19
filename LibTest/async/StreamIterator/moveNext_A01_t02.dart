/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future<bool> moveNext()
 * Wait for the next stream value to be available.
 * It is not allowed to call this function again until the future has completed.
 * If the returned future completes with anything except true, the iterator is done,
 * and no new value will ever be available.
 * The future may complete with an error, if the stream produces an error.
 * @description Checks that future returned by moveNext() completes with
 * an error if stream produces an error and that iterator is automatically
 * cancelled after that (see doc on cancel).
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var c = new StreamController();
  var si = new StreamIterator(c.stream);

  asyncStart();

  si.moveNext().then((value) {
    Expect.identical(true, value);
    Expect.identical(1, si.current);
    si.moveNext().catchError((value) {
      Expect.identical(2, value);
      si.moveNext().then((value) {
        Expect.identical(false, value);
        asyncEnd();
      });
    });
  });

  c.add(1);
  c.addError(2);
  c.add(3);
  c.close();
}
