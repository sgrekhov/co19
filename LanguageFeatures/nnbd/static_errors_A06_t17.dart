// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if a mixin declaration or a class declaration with
/// no generative constructors declares an instance variable without an
/// initializing expression which is final or whose type is potentially
/// non-nullable, unless the variable is marked with a `late`, `abstract`, or
/// `external` modifier.
///
/// @description Check that it is an error if a class declaration with no
/// generative constructors declares an instance variable with a potentially
/// non-nullable type and no initializing expression. Test `FutureOr<F>` where
/// `F` is a function type
/// @author sgrekhov@unipro.ru
/// @issue 40677
/// @issue 40940

import "dart:async";

typedef void Foo();
void foo() {}

class C {
  FutureOr<Function> f1;
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified
  FutureOr<Foo> f2;
//              ^^
// [analyzer] unspecified
// [cfe] unspecified

  factory C.f() = D;
}

class D implements C {
  FutureOr<Function> f1 = foo;
  FutureOr<Foo> f2 = foo;

  D();
}

main() {
  print(C);
}
