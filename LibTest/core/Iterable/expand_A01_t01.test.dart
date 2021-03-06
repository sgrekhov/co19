/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable expand(Iterable f(E element))
 * Expand each element of this Iterable into zero or more elements.
 * The resulting Iterable will run through the elements returned by f for each
 * element of this, in order.
 * @description Checks that the function [f] is called for every element of the list.
 * Checks that resulting Iterable will run through the elements returned by f for each
 * element of this, in order.
 * @author kaigorodov
 */
library elementAt_A03_t01;

import "../../../Utils/expect.dart";

class A {
  A() {}
}

test(Iterable create([Iterable content])) {

  check(List a0, bool predicate(var e), exc) {

  void checkCount(List a0) {
    List a=create();
    a.addAll(a0);
    int count=0;
    Iterable expanded=a.expand((var element) {
      Expect.equals(a[count], element);
      count++;
      return [element];
    });
    Expect.listEquals(a, expanded.toList());
    Expect.equals(a.length, count);
  }
  List a=new List();
  checkCount(a);
  a.add(22);
  checkCount(a);
  a.add(11);
  checkCount(a);
  a.add(11);
  checkCount(a);
}
