/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an expression of the form throw; 
 * is not enclosed within an on-catch clause.
 * @note the assertion in no longer in spec, though it should be compile-error
 * to use throw with no expression.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

main() {
  throw;
}
