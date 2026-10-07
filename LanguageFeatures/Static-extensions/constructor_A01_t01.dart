// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an instance creation expression of the form
/// `C.name(arguments)`. Assume that `C` denotes a type introducing membered
/// declaration `D`. Assume that `D` does not declare a constructor with
/// uniform base constructor name `name`.
/// ...
/// Let `M` be the set of accessible extensions with on-declaration `D` that
/// declare a constructor with uniform base constructor name `name` or a static
/// member with basename `name`.
/// ...
/// Otherwise, `M` only includes extensions containing constructors with the
/// requested name. A compile-time error occurs if `M` is empty, or `M`
/// contains two or more elements.
///
/// @description Checks that it is a compile-time error if `M` is empty.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=static-extensions

class A {}

class B {}

class C extends A {}

mixin M {}

extension type ET(B _) implements B {}

enum E {
  e0;
}

extension ExtA on A {
  factory foo() => A();
}

extension ExtM on Object {
  factory bar() => Object();
}

extension ExtB on B {
  factory baz() => B();
}

extension ExtE on Enum {
  factory qux() => E.e0;
}

main() {
  C.foo();
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  M.bar();
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET.baz();
//   ^^^
// [analyzer] unspecified
// [cfe] unspecified

  E.qux();
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
