/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HashSet<E> class 
 * Implements Set<E>
 * @description Checks that all members of [Set] are implemented.
 * @author kaigorodov
 */
import "dart:collection";
import "allTests.lib.dart";

Iterable create([Iterable content]) {
  HashSet res = new HashSet();
  if (content!=null) {
    res.addAll(content);
  }
  return res;
}  

main() {
  test(create);  
}
