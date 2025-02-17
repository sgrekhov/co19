// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion - type cast If `N` is an expression of the form `E1 as S` where
/// the static type of `E1` is `T` then:
/// - Let `before(E1) = before(N)`
/// - Let `after(N) = promote(E1, S, after(E1))`
///
/// @description Checks that flow analysis promotes a variable after a type cast
/// inside collection literals.
/// @author sgrekhov22@gmail.com

void test1(Object o) {
  var i = 0;
  <bool>[
    if(o as bool)
      o
  ];
}

void test2(Object o) {
  <bool>{
    if(o as bool)
      o
  };
}

void test3(Object o) {
  <String, bool>{
    if(o as bool)
      "key": o
  };
}

void test4(Object o) {
  <bool, String>{
    if(o as bool)
      o: "value"
  };
}

main() {
  test1(true);
  test2(true);
  test3(true);
  test4(true);
}
