// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `m` and `m′` be member signatures with the same name `id`.
/// Then `m` is a correct override of `m′` iff the following criteria are all
/// satisfied:
/// ...
/// • If `m` and `m′` are both methods or both setters: Let F be the function
///   type of `m` except that the parameter type is the built-in class `Object`
///   for each parameter of `m` which is covariant-by-declaration. Let `F′` be
///   the function type of `m′`. `F` must then be a subtype of `F′`.
///
/// Note that a parameter which is covariant-by-declaration must have a type
/// which satisfies one more requirement, relative to the corresponding
/// parameters in all superinterfaces, both direct and indirect
///
/// @description Checks that it is a compile-time error if `m` and `m′` are both
/// generic methods and a function type of `m` is not a subtype of `m′.
/// @author sgrekhov22@gmail.com
/// @issue 60011

class A<T extends num> {
  X foo<X extends T>(X x) => x;
}

class C<T extends num> extends A<num> {
  int v;
  C(this.v);
  X foo<X extends T>(X x) => x + v as X;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  C<int>(1);
}
