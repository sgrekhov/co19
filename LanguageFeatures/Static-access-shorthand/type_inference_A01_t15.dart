// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that if a shorthand context type schema has one of the
/// forms `FutureOr<C>`, `FutureOr<C<...>>`, `FutureOr<C>?`,
/// `FutureOr<C<...>>?`, `FutureOr<C?>`, `FutureOr<C<...>?>`, `FutureOr<C?>?` or
/// `FutureOr<C<...>?>?` and `C` is a type introduced by the type declaration
/// `D`, then the shorthand context denotes the type declaration `D`. Test an
/// extension type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import 'dart:async';
import '../../Utils/expect.dart';

extension type ET<T>(T value) {
  ET.id(this.value);
  factory ET.f(T t) = ET;

  static ET<int> get staticGetter => ET(4);
  static ET<X> staticMethod<X>(X x) => ET<X>(x);
  static ET<String> instance = ET("one");
}

main() async {
  FutureOr<ET?>? et1 = ET.new(1);
  Expect.equals(1, (await et1)?.value);

  FutureOr<ET<int>?>? et2 = ET.id(2);
  Expect.equals(2, (await et2)?.value);

  FutureOr<ET?>? et3 = ET.f(3);
  Expect.equals(3, (await et3)?.value);

  FutureOr<ET<int>?>? et4 = ET.staticGetter;
  Expect.equals(4, (await et4)?.value);

  FutureOr<ET<int>?>? et5 = ET.staticMethod<int>(5);
  Expect.equals(5, (await et5)?.value);

  FutureOr<ET<String>?>? et6 = ET.instance;
  Expect.equals("one", (await et6)?.value);
}
