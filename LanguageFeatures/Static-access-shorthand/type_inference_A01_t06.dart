// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A context type scheme is said to denote a declaration in some
/// cases. Not all context type schemes denote a declaration.
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

// SharedOptions=--enable-experiment=dot-shorthands

class A {
  int v;
  A(this.v);
  A.id(this.v);

  static A get zero => A(0);
}

class C extends A {
  C(int v) : super(v);
  C.id(int v) : super.id(v);

  static C get zero => C(0);
}

void foo<X, Y, Z>(X x, Y y, Z z) {}
void bar<X extends A, Y extends A, Z extends A>(X x, Y y, Z z) {}

main() {
  foo(
      .zero,
//    ^
// [analyzer] unspecified
// [cfe] unspecified
      .new(1),
//    ^
// [analyzer] unspecified
// [cfe] unspecified
      .id(2)
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  );

  bar(
      .zero,
//    ^
// [analyzer] unspecified
// [cfe] unspecified
      .new(1),
//    ^
// [analyzer] unspecified
// [cfe] unspecified
      .id(2)
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  );
}
