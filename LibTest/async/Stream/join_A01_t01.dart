/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<String> join([String separator = ""])
 * Collects string of data events' string representations.
 * If separator is provided, it is inserted between any two elements.
 * @description Checks that it joins string representations correctly.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  var iter = [1,null,false,true,'string',#symbol,(x)=>x++];
  iter.add(iter); // add self reference
  var s = new Stream.fromIterable(iter);

  asyncStart();
  s.join().then((x) {
    Expect.equals(iter.join(), x);
    asyncEnd();
  });
}

