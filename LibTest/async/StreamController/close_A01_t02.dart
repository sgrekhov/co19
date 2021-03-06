/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future close()
 * Close the StreamSink. It'll return the done Future.
 * @description Checks that the stream closes.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  StreamController controller=new StreamController();
  controller.close();
  asyncStart();
  controller.stream.listen((value) {
    Expect.fail("unexpected onData call");
  },
  onError:(error1) {
    Expect.fail("unexpected onError call");
  },
  onDone:() {
    asyncEnd();
  });
}
