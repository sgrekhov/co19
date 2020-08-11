/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void write(Object obj)
 * This operation is non-blocking.
 * @description Checks that [write] is non-blocking operation.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

run_process(IOSink sink) {
  sink.write("Test1");
  sink.write("Test2");
  sink.write("Test3");
}

run_main(String mode) async {
  String executable = Platform.resolvedExecutable;
  String eScript = Platform.script.toString();
  int called = 0;
  await Process.run(
          executable, ["--enable-experiment=non-nullable", eScript, mode])
      .then((ProcessResult results) {
    Expect.equals(
        "Test1Test2Test3", mode == "err" ? results.stderr : results.stdout);
    called++;
  });
  Expect.equals(1, called);
}

main(List<String> args) {
  if (args.length > 0)
    run_process(args[0] == "err" ? stderr : stdout);
  else {
    run_main("out");
    run_main("err");
  }
}
