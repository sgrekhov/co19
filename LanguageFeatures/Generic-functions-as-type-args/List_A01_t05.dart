// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Allow generic function types as type arguments and bounds
///
/// The language disallows generic function types as type arguments and bounds.
///
///  late List<T Function<T>(T)> idFunctions; // INVALID.
///  var callback = [foo<T>(T value) => value]; // Inferred as above, then invalid.
///  late S Function<S extends T Function<T>(T)>(S) f; // INVALID.
///
/// We remove that restriction, so a type argument and a bound can be a generic
/// function type.
///
/// This requires no new syntax, and in some cases only the removal of a single
/// check. There might be some platforms where the implementation currently
/// assumes that generic function types cannot occur as the value of type
/// variables (an proof-of-concept attempt hit an assert in the VM). Such
/// assumptions will need to be flushed out with tests and fixed.
///
/// Because we already infer List<T Function<T>(T)> in the code above, this
/// change will not affect type inference, it will just make the inferred type
/// not be an error afterwards.
///
/// We do not expect the removal of this restriction to affect the feasibility of
/// type inference. After all, it's already possible to have a generic function
/// type occurring covariantly in a type argument, like List<T Function<T>(T)
/// Function()>.
/// @description Checks statically that generic invariant function can be a type
/// argument and bound for List.
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=generic-metadata

T test1<T>(T i) => i;
void test2<T>() {}
T test3<T>() => 0 as T;
void test4<T>(T i) {}

main() {
  List<T Function<T>(T)> l1 = <T Function<T>(T)>[];
  l1.add(test1);

  l1.add(1);
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  l1.add(test2);
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  l1.add(test3);
//       ^
// [analyzer] unspecified
// [cfe] unspecified

  l1.add(test4);
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}
