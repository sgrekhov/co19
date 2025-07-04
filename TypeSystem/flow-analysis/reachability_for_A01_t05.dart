// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion for statement: If `N` is a for statement of the form
/// `for (D; C; U) S,` then:
/// - Let `before(D) = before(N)`.
/// - Let `before(C) = conservativeJoin(after(D), assignedIn(N), capturedIn(N))`
/// - Let `before(S) = split(true(C))`.
/// - Let `before(U) = merge(after(S), continue(S))`.
/// - Let `after(N) = inheritTested(join(false(C), unsplit(break(S))), after(U))`
///
/// @description Checks that
/// `before(C) = conservativeJoin(after(D), assignedIn(N), capturedIn(N))`. Test
/// that `assignedIn(S)` is detected by flow analysis.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

test1() {
  late int n;
  for (
    ;
    () {
      if (1 > 2) {
        n; // possibly assigned
      }
      return true;
    }();
  ) {
    n = 42;
  }
}

test2() {
  late int n;
  [
    for (
      ;
      () {
        if (1 > 2) {
          n;
        }
        return true;
      }();
    )
      n = 42,
  ];
}

test3() {
  late int n;
  <int, int>{
    for (
      ;
      () {
        if (1 > 2) {
          n;
        }
        return true;
      }();
    )
      n = 42: 0,
  };
}

test4() {
  late int n;
  <int, int>{
    for (
      ;
      () {
        if (1 > 2) {
          n;
        }
        return true;
      }();
    )
      0: n = 42,
  };
}

test5() {
  late int n;
  for (
  ;
      () {
    if (1 > 2) {
      n; // possibly assigned
    }
    return true;
  }();
  ) {
    (n,) = (42,);
  }
}

test6() {
  late int n;
  [
    for (
    ;
        () {
      if (1 > 2) {
        n;
      }
      return true;
    }();
    )
      (x: n) = (x: 42),
  ];
}

test7() {
  late int n;
  <C, int>{
    for (
    ;
        () {
      if (1 > 2) {
        n;
      }
      return true;
    }();
    )
      (C(v: n) = C(42)): 0,
  };
}

test8() {
  late int n;
  <int, C>{
    for (
    ;
        () {
      if (1 > 2) {
        n;
      }
      return true;
    }();
    )
      0: (C(v: n) = C(42)),
  };
}


main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
  print(test5);
  print(test6);
  print(test7);
  print(test8);
}
