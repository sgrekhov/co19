// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Switch statements and expressions with a sealed class as a
/// matched type are always exhaustive
///
/// @description Check that it is a compile-time error if the matched value type
/// of a switch expression is a sealed class and the set of cases is not
/// exhaustive. Test `base mixin`
/// @author sgrekhov22@gmail.com
/// @issue 53392

sealed class S {}

base mixin M on S {}

class C extends S {}

base class F extends S with M {}

int test1(S s) {
  switch (s) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case C _: return 1;
  }
}

int test2(S s) {
  switch (s) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case F _: return 1;
  }
}

int test3(S s) {
  switch (s) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case M _: return 1;
  }
}

int test4(S s) {
  switch (s) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case C _: return 1;
    case F _: return 2;
  }
}

int test5(S s) {
  switch (s) {
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    case M _: return 1;
    case F _: return 2;
  }
}

int test6(S s) {
  switch (s) { // Ok, exhaustive
    case C _: return 1;
    case M _: return 2;
  }
}

void main() {
  S s = F();
  int i1 = switch (s) { C() => 1 };
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int i2 = switch (s) { F() => 1 };
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int i3 = switch (s) { M() => 1 };
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var i4 = switch (s) { C() => 1, F() => 2 };
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final i5 = switch (s) { M() => 1, F() => 2 };
//           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  int i6 = switch (s) { C() => 1, M() => 2 }; // Ok, exhaustive

  print(test1);
  print(test2);
  print(test3);
  print(test4);
  print(test5);
  print(test6);
}
