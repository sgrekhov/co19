/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart supports two levels of privacy: public and private.
 * A declaration is private if it begins with an underscore (the _ character) otherwise it is public.
 * A declaration m is accessible to library L if m is declared in L or if m is public.
 * @description Checks that prefix names can begin with an underscore.
 * @author iefremov
 * @needsreview Issue 2242
 */

#import("lib.dart", prefix:"_abc");

main() {
  _abc.accessibleVariable = 54;
  Expect.equals(1, _abc.accessibleVariable);
}