// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Declaration denoted by a type scheme A context type scheme is
/// said to denote a declaration in some cases. Not all context type schemes
/// denote a declaration.
/// If a type scheme `S`:
/// - has the form `C` or `C<typeArgs>` where `C` is a type introduced by a
///   declaration `D` which must therefore be a type-introducing declaration,
///   which currently means a class, mixin, enum or extension type declaration,
///   then `S` denotes the declaration `D`.
/// - has the form `S?` or `FutureOr<S>`, and the type scheme S denotes a
///   declaration D, then so does `S?/FutureOr<S>`. Only the "base type" of the
///   union type is considered, ensuring that a type scheme denotes at most one
///   declaration or static namespace.
/// - has any other form, including type variables, promoted type variables and
///   `_`, then the type scheme does not denote any declaration or namespace.
///
/// @description Checks that in case of context type `_` the type scheme does
/// not denote any declaration and it is a compile-time error to use a shorthand
/// in this case.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

main() {
  int v1 = (.parse("42")).abs();
//          ^
// [analyzer] unspecified
// [cfe] unspecified

  int v2 = .parse("42") + 1;
//         ^
// [analyzer] unspecified
// [cfe] unspecified

  dynamic v3 = .parse("42");
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}
