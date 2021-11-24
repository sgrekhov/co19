// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Directory renameSync(String newPath)
/// Synchronously renames this directory. Returns a Directory instance for the
/// renamed directory.
///
/// If [newPath] identifies an existing directory, then the behavior is
/// platform-specific. On all platforms, a [FileSystemException] is thrown
/// if the existing directory is not empty. On POSIX systems, if [newPath]
/// identifies an existing empty directory then that directory is deleted
/// before this directory is renamed.
///
/// If newPath identifies an existing file the operation fails and a
/// [FileSystemException] is thrown.
///
/// @description Checks that if newPath identifies an existing not empty
/// directory (contains a link) then a [FileSystemException] is thrown
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  Directory srcDir = getTempDirectorySync(parent: sandbox);
  Directory targetDir = getTempDirectorySync(parent: sandbox);
  Directory linkDir = getTempDirectorySync(parent: sandbox);
  Link l = getTempLinkSync(parent: targetDir, target: linkDir.path);

  Expect.throws(() {
    srcDir.renameSync(targetDir.path);
  }, (e) => e is FileSystemException);
  Expect.isTrue(targetDir.existsSync());
  Expect.isTrue(srcDir.existsSync());
  Expect.isTrue(l.existsSync());
}