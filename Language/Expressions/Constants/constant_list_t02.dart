/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant list literal is a constant expression.
 * @description Checks that a non-constant list literal cannot be assigned to
 * a constant variable.
 * @author iefremov
 * @compile-error
 * @reviewer rodionov
 */

const a = [];

main() {
  try {
    print(a);
  } catch(x) {}
}
