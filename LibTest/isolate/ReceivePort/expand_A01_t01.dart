// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Stream expand(Iterable convert(T value))
/// Creates a new stream from this stream that converts each element into zero or more events.
/// Each incoming event is converted to an Iterable of new events, and each of these new events
/// are then sent by the returned stream in order.
/// @description Checks that returned stream produces all the values generated by the convert function.
/// @author kaigorodov

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

check(List list, Iterable convert(var value), List expected) {
  Stream s1 = IsolateStream.fromIterable(list);
  Stream s2 = s1.expand(convert);
  List actual = [];
  StreamSubscription ss = s2.listen((event) {
    actual.add(event);
  });
  asyncStart();
  ss.onDone(() {
    Expect.listEquals(expected, actual);
    asyncEnd();
  });
}

void checkList(List list) {
  check(list, (var value) => [], []);
  check(list, (var value) => [value], list);

  List expected = [];
  for (var el in list) {
    expected.add(el);
    expected.add(el);
  }
  check(list, (var value) => [value, value], expected);

  expected = [];
  for (var el in list) {
    expected.add(el);
    expected.add(null);
  }
  check(list, (var value) => [value, null], expected);
}

main() {
  checkList([]);
  checkList([null]);
  checkList([1, 2, 3]);
}
