// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a member declaration needs to reference a static or instance
/// member declared in another introductory or augmenting declaration of the
/// same type, it can use `this.name` for instance members an `TypeName.name`
/// for static members to be absolutely sure. Or it can rely on the default if
/// `name` is not in the lexical scope at all, in which case it’s interpreted as
/// `this.name` if it occurs inside a scope where a `this` is available.
///
/// @description Checks that it is possible to use `this.name` and
/// `TypeName.name` for referencing declarations in another introductory or
/// augmenting declaration. Test a variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'scoping_A01_t01_lib.dart';

const foo = "Should not be used!";
const bar = "Should not be used!";

class C {
  static const foo = "foo";
  String bar = "bar";

  void testAugmenting() {
    Expect.equals("baz", C.baz);
    Expect.equals("qux", this.qux);
  }
}

mixin M {
  static const foo = "foo";
  String bar = "bar";

  void testAugmenting() {
    Expect.equals("baz", C.baz);
    Expect.equals("qux", this.qux);
  }
}

enum E {
  e0;
  static const foo = "foo";
  final String bar = "bar";

  void testAugmenting() {
    Expect.equals("baz", C.baz);
    Expect.equals("qux", this.qux);
  }
}

class A {}

extension Ext on A {
  static const foo = "foo";

  void testAugmenting() {
    Expect.equals("baz", C.baz);
  }
}

extension type ET(String id) {
  static const foo = "foo";

  void testAugmenting() {
    Expect.equals("baz", C.baz);
  }
}

class MA = Object with M;

main() {
  C().testAugmenting();
  C().testIntroductory();
  MA().testAugmenting();
  MA().testIntroductory();
  E.e0.testAugmenting();
  E.e0.testIntroductory();
  A().testAugmenting();
  A().testIntroductory();
  ET("id").testAugmenting();
  ET("id").testIntroductory();
}
