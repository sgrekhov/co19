// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant expression is an expression whose value can never
/// change, and that can be evaluated entirely at compile time.
/// A constant expression is one of the following:
/// ...
/// • An expression of the form e as T is potentially constant if e is a
///   potentially constant expression and T is a constant type expression, and
///   it is further constant if e is constant.
/// ...
/// A constant type expression is one of:
/// • An simple or qualified identifier denoting a type declaration (a type
///   alias, class or mixin declaration) that is not qualified by a deferred
///   prefix, optionally followed by type arguments of the form <T1, ..., Tn>
///   where T1, ..., Tn are constant type expressions.
/// • A type of the form FutureOr<T> where T is a constant type expression.
/// • A function type R Function<typeParameters>(argumentTypes) (where
///   R and <typeParameters> may be omitted) and where R, typeParameters
///   and argumentTypes (if present) contain only constant type expressions.
/// • The type void.
/// • The type dynamic
///
/// @description Checks that it is a compile-time error to use the constant of
/// type `void`
/// @author sgrekhov22@gmail.com

typedef VoidAlias = void;

main() {
  const c1 = 1 as VoidAlias;

  print(c1);
//      ^^
// [analyzer] unspecified
// [cfe] unspecified
}
