// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The invocation of a constructor is not using an instantiated
/// type, it’s behaving as if the constructor was preceded by a raw type, which
/// type inference should then infer type arguments for. Doing
/// `List<int> l = .filled(10, 10);` works like doing
/// `List<int> l = List.filled(10, 10);`, and it is the following downwards
/// inference with context type `List<int>` that makes it into
/// `List<int>.filled(10, 10);`. This distinction matters for something like:
/// ```
/// List<String> l =
///   .generate(10, (int i) => i + 1).map((x) => x.toRadixString(16)).toList();
/// ```
/// which is equivalent to inserting `List` in front of `.generate`, which will
/// then be inferred as `List<int>`. In most normal use cases it doesn’t matter,
/// because the context type will fill in the missing type variables, but if the
/// construction is followed by more selectors, it loses that context type.
///
/// @description Checks that it is a compile-time error to use a shorthand
/// expression if additional selectors strip its context type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

main() {
  List<String> l =
      .generate(10, (int i) => i + 1).map((x) => x.toRadixString(16)).toList();
//    ^
// [analyzer] unspecified
// [cfe] unspecified

  num n = .parse("42").abs();
//        ^
// [analyzer] unspecified
// [cfe] unspecified

  int i = (.parse("42")).abs();
//         ^
// [analyzer] unspecified
// [cfe] unspecified

  int v = .parse("42") + 1;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}
