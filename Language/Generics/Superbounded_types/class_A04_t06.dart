// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a parameterized type `T` is
/// super-bounded when it is used in any of the following ways:
/// ...
/// - `T` is an immediate subterm of an `extends` clause of a class, or it
/// occurs as an element in the type list of an `implements` clause, or a `with`
/// clause, or it occurs as an element in the type list of an `on` clause of a
/// mixin.
///
/// @description Checks that it is not an error to declare an extension on a
/// super-bounded class.
/// @author sgrekhov22@gmail.com

class A<T extends A<T>> {}

extension Ext1 on A {}

extension on A<dynamic> {}

extension on A<Object?>{}

extension on A<void> {}

extension on A<A<dynamic>> {}

extension on A<A<Object?>> {}

extension on A<A<void>> {}

main() {
  print(A);
}
