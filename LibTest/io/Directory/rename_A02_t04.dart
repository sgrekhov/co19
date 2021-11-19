// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<Directory> rename(String newPath)
/// Renames this directory. Returns a Future<Directory> that completes with a
/// Directory instance for the renamed directory.
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
/// @description Checks that on POSIX systems, if [newPath] identifies an
/// existing empty directory then that directory is deleted before this
/// directory is renamed.
/// @author sgrekhov@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";
import "../file_utils.dart";

main() async {
  await inSandbox(_main);
}

_main(Directory sandbox) async {
  bool isPosix = Platform.isAndroid ||
      Platform.isIOS ||
      Platform.isMacOS ||
      Platform.isLinux ||
      Platform.isFuchsia;
  if (isPosix) {
    Directory srcDir = getTempDirectorySync(parent: sandbox);
    Directory targetDir = getTempDirectorySync(parent: sandbox);
    asyncStart();
    await srcDir.rename(targetDir.path).then((renamed) {
      Expect.equals(targetDir.path, renamed.path);
      Expect.isTrue(renamed.existsSync());
      Expect.isFalse(srcDir.existsSync());
      asyncEnd();
    });
  }
}