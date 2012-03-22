/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart supports two levels of privacy: public and private.
 * A declaration is private if it begins with an underscore (the _ character) otherwise it is public.
 * A declaration m is accessible to library L if m is declared in L or if m is public.
 * @description Checks that a compile-time error is produced when trying to access a private factory
 * constructor that is not accessible in a current script.
 * @compile-error
 * @author iefremov
 */

#import("lib.dart");

main() {
  try {
    new ClassWithPrivateMembers._named2();
  } catch(var x) {}
}
