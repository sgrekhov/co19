// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future addStream(
///   Stream<T> source, {
///   bool? cancelOnError,
/// })
/// Receives events from source and puts them into this controller's stream.
///
/// Returns a future which completes when the source stream is done.
///
/// Events must not be added directly to this controller using `add`,
/// `addError`, `close` or `addStream`, until the returned future is complete.
///
/// Data and error events are forwarded to this controller's stream. A done
/// event on the source will end the addStream operation and complete the
/// returned future.
///
/// If `cancelOnError` is `true`, only the first error on `source` is forwarded
/// to the controller's stream, and the `addStream` ends after this. If
/// `cancelOnError` is `false`, all errors are forwarded and only a done event
/// will end the `addStream`. If `cancelOnError` is omitted or null, it defaults
/// to `false`.
///
/// @description Checks that if `cancelOnError` is omitted it defaults to
/// `false`.
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  var source = StreamController<int>();
  source.add(1);
  source.add(2);
  source.addError(-1);
  source.add(3);
  source.addError(-2);
  source.close();

  var stream = Stream<int>.multi((controller) {
    controller.addStream(source.stream).then((_) {
      controller.close();
    });
  });
  listen(stream);
}

void listen(Stream<int> stream) {
  int eventsCounter = 0;
  int errorsCounter = 0;
  stream.listen((v) {
    Expect.equals(++eventsCounter, v);
  }, onError: (e) {
    Expect.equals(--errorsCounter, e);
  }, onDone: () {
    Expect.equals(3, eventsCounter);
    Expect.equals(-2, errorsCounter);
    asyncEnd();
  });
}
