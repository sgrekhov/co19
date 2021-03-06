/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class declaration, or type alias G may be generic.
 * typeParameter: metadata identifier (extends type)? ;
 * typeParameters: '<' typeParameter (',' typeParameter)* '>' ;
 * @description Checks that metadata can be attached to type parameter.
 * @author ilya
 */

const constant = 0;

class Foo {
  const Foo.bar(x);
}

class C <@Foo.bar(0) @constant T, @Foo.bar(1) TT extends List<T>> {}

main() {
  new C();
}
