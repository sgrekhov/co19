// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion @Since("2.9")
///   Stream<T>.multi(
///     void onListen( MultiStreamController<T> ), {
///     bool isBroadcast = false,
///   })
/// Creates a multi-subscription stream.
///
/// Each time the created stream is listened to, the `onListen` callback is
/// invoked with a new [MultiStreamController], which forwards events to the
/// [StreamSubscription] returned by that [listen] call.
///
/// This allows each listener to be treated as an individual stream.
///
/// The [MultiStreamController] does not support reading its
/// [StreamController.stream]. Setting its [StreamController.onListen] has no
/// effect since the `onListen` callback is called instead, and the
/// [StreamController.onListen] won't be called later. The controller acts like
/// an asynchronous controller, but provides extra methods for delivering events
/// synchronously.
///
/// If `isBroadcast` is set to true, the returned stream's [Stream.isBroadcast]
/// will be true. This has no effect on the stream behavior, it is up to the
/// `onListen` function to act like a broadcast stream if it claims to be one.
///
/// A multi-subscription stream can behave like any other stream. If the
/// `onListen` callback throws on every call after the first, the stream behaves
/// like a single-subscription stream. If the stream emits the same events to
/// all current listeners, it behaves like a broadcast stream.
///
/// @description Checks that each time the created stream is listened to, the
/// `onListen` callback is invoked with a new instance of
/// [MultiStreamController].
/// @author sgrekhov22@gmail.com

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  asyncStart();
  MultiStreamController<int>? c1, c2;
  var stream = Stream<int>.multi((MultiStreamController<int> controller) {
    if (c1 == null) {
      c1 = controller;
    } else {
      c2 = controller;
    }
    for (var v in [1, 2, 3, 4, 5]) {
      controller.add(v);
    }
    controller.close();
  });

  stream.listen((v) {}, onDone: () {
    stream.listen((v) {}, onDone: () {
      Expect.notIdentical(c1, c2);
      asyncEnd();
    });
  });
}
