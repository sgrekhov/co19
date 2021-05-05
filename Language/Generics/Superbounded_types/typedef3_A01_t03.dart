/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any use of a type [T] which is not well-bounded is a
 * compile-time error.
 * @description Checks that compile error is not thrown when non-function type
 * alias with well bounded type parameter is declared
 * @Issue 44830
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class A<T extends A<T>> {}

typedef B1<X> = A<X>;
//                ^
// [analyzer] unspecified
// [cfe] unspecified

typedef B2<X extends A<dynamic>> = A<X>;
//                                   ^
// [analyzer] unspecified
// [cfe] unspecified

typedef B3<X extends A<Never>> = A<X>;

typedef B4<X extends A<void>> = A<X>;
//                                ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}