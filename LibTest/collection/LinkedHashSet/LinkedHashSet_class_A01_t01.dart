/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashSet<E> class 
 * Implements Set<E>
 * @description Checks that all members of [Set] are implemented.
 * @author kaigorodov
 */
import "dart:collection";
import "../HashSet/allTests.lib.dart";

Iterable create([Iterable content]) {
  LinkedHashSet res = new LinkedHashSet();
  if (content!=null) {
    res.addAll(content);
  }
  return res;
}  

main() {
  test(create);  
}
