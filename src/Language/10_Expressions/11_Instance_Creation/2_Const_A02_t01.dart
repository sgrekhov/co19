/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let e be a constant object expression of the form
 * const T.id(a1, .., an, xn+1: an+1, …, xn+k: an+k) or the form
 * const T(a1, .., an, xn+1: an+1, …, xn+k: an+k). It is a compile-time error if
 * T is not a class or interface accessible in the current scope,
 * optionally followed by type arguments.
 * @description Checks that it is a compile-time error if T is not a
 * class or interface accessible in the current scope.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  try {
    const UnavailableType();
  } catch(e) {}
}
