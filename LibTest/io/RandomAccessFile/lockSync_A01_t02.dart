// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// void lockSync([
///     FileLock mode = FileLock.exclusive,
///     int start = 0,
///     int end = -1
///     ])
/// Synchronously locks the file or part of the file.
///
/// By default an exclusive lock will be obtained, but that can be overridden by
/// the mode argument.
///
/// @description Checks that method lockSync synchronously locks the whole file
/// (in a specified mode).
/// @author ngl@unipro.ru

import "dart:async";
import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";
import "lock_check_1_lib.dart";

void check(int fLen) {

  File file = getTempFileSync();
  asyncStart();
  var rf = file.openSync(mode: FileMode.write);
  rf.writeFromSync(new List.filled(fLen, 1));
  rf.lockSync(FileLock.shared);
  Expect.isTrue(fLen == rf.lengthSync());
  String eScript = Platform.script.toString();
  var tests = [
    () => checkLocked(eScript, rf.path),
    () => checkUnlocked(eScript, rf.path, 0, fLen, FileLock.shared)
  ];
  Future.forEach(tests, (Function f) => f()).whenComplete(() {
    asyncEnd();
    rf.unlockSync();
    rf.closeSync();
    file.deleteSync();
  });
}

runMain() {
  check(10);
  check(100);
  check(1000);
}

main(List<String> args) {
  if(args.length > 0)
    runProcess(args);
  else {
    runMain();
  }
}
