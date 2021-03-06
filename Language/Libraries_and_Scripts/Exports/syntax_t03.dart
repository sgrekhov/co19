/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * libraryExport:
 *   metadata export uri combinator* `;'
 * ; 
 * @description Checks that it is not an error when the identifiers used with show/hide combinators 
 * are also named 'hide' and 'show', and that filtering the export namespace is done correctly.
 * @static-warning
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

import "syntax_t03_lib.dart";

main() {
  Expect.equals(hide, "hide");
  Expect.equals(show, "show");

  try {
    var x = foo; /// static type warning cannot resolve
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(ok) {}
}
