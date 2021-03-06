/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A mixin application of the form S with M 1 , . . . , M k ; defines a class C whose
 * superclass is the application of the mixin composition M k−1 ∗ . . . ∗ M 1 to S
 * ...
 * It is a compile-time error if M (respectively, any of M 1 , . . . , M k ) is an
 * enumerated type or a malformed type.
 * @description Checks that it is a compile-time error if Mi is an enumerated type
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class S {
}

class M1 {
}

enum M2 {a, b, c}

class C = S with M1, M2;

main() {
}
