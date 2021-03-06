/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An ordinary method invocation i has the form
 * o.m(a1, . . . , an, xn+1 : an+1, ... , xn+k :an+k)
 * where o is not the name of a class or a library prefix.
 * @description Checks that it is a compile-time error if named
 * arguments precede positional arguments.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  var o;
  try {
    o.f(name: null, 1);
  } catch(e) {}
}
