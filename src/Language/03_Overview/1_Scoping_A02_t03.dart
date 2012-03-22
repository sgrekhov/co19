/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Names in nested scopes may hide names in lexically enclosing scopes, however,
 * it is a static warning if a declaration introduces a name that is available in a
 * lexically enclosing scope.
 * @description Checks that a name in the scope of a for statement can hide the name in the
 * lexically enclosing scope and that produces a static-type warning.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */

main() {
  var x;
  for(int i = 0; i < 2; ++i) {
    var x = i;
  }
}
