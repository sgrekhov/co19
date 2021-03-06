/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A script is a library whose exported namespace includes a
 * top-level function main().
 *
 * libraryDefinition:
 *   scriptTag? libraryName? libraryImport* partDirective* topLevelDefinition*
 * ;
 * @description Checks that it is nor an error when a script (without a script tag)
 * includes an export directive.
 * @author rodionov
 * @reviewer kaigorodov
 */
export "library1.dart";

main() {
  var x;
}
