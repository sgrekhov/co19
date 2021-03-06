/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Future<List> wait(Iterable<Future> futures)
 * Wait for all the given futures to complete and collect their values.
 * Returns a future which will complete once all the futures in a list are complete.
 * @description Checks that the returned future is completed if all futures from a list
 * are completed before calling [wait].
 * @author msyabro
 * @reviewer iefremov
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

const N=5;

main() {
  List<Completer> completers=new List<Completer>(N);
  for (int k=0; k<N; k++) {
    completers[k] = new Completer();
  }
  List<Future> futures=new List<Future>(N);
  for (int k=0; k<N; k++) {
    futures[k] = completers[k].future;
  }

  for (int k=0; k<N; k++) {
    completers[k].complete(k);
  }

  Future f = Future.wait(futures);

  asyncStart();
  f.then((value) {
    Expect.listEquals([0,1,2,3,4], value);
    asyncEnd();
  });
}
