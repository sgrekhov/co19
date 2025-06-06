// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a variable `x` is promotable via type test with type
/// `T` given variable model `VM` if
/// - `VM = VariableModel(declared, promoted, tested, assigned, unassigned,
///     captured)`
/// - and `captured` is `false`
/// - and `S` is the current type of `x` in `VM`
/// - and not `S <: T`
/// - and `T <: S` or (`S` is `X extends R` and `T <: R`) or (`S` is `X & R` and
///   `T <: R`)
///
/// @description Checks that a variable is not promotable if `captured` is not
/// `false`.
/// @author sgrekhov@unipro.ru

class S {}
class T extends S {
  int foo() => 42;
}

test(var v, bool b) {
  S x = new T();
  if (x is T) {
    if (b) {
      x = v;
    }
    x.foo();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  T t = new T();
  test(t, false);
}
