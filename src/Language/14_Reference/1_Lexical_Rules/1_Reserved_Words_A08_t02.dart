/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion "do" is a reserved word.
 * @description Checks that it is a compile-time error when a reserved word "do"
 * is used as a type parameter name.
 * @compile-error
 * @author rodionov
 * @reviewer iefremov
 */

class C<do> { }

main() {}
