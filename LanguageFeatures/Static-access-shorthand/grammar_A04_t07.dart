// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We introduce grammar productions of the form:
/// ```
/// <postfixExpression> ::= ...            -- all current productions
///     | <staticMemberShorthand>          -- added production
///
/// <constantPattern> ::=  ...             -- all current productions
///     | <staticMemberShorthandValue>     -- No selectors, no `.new`.
///
/// <staticMemberShorthand> ::= <staticMemberShorthandHead> <selector>*
///
/// <staticMemberShorthandHead> ::=
///       <staticMemberShorthandValue>
///     | '.' 'new'                                       -- shorthand unnamed constructor
///
/// <staticMemberShorthandValue> ::=                      -- something that can potentially create a value.
///     | '.' <identifier>                                -- shorthand for qualified name
///     | 'const' '.' (<identifier> | 'new') <arguments>  -- shorthand for constant object creation
///  ```
///
/// @description Checks that the static access short syntax can be used with
/// the `<<` operator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C {
  static C two = C(2);

  int value;
  C(this.value);

  C operator <<(C other) => C(value << other.value);
}

mixin M {
  static M two = MC(2);

  M operator <<(M other) => MC(0);
}
class MC with M {
  int value;
  MC(this.value);
}

enum E {
  e0, e1, e2;
  static E two = E.e2;

  E operator <<(E other) => E.e0;
}

extension type ET(int v) implements int {
  static ET two = ET(2);

  ET operator <<(ET other) => ET(this.v << other.v);
}

main() {
  C c = C(1) << .two;
  Expect.equals(4, c.value);

  M m = MC(2) << .two;
  Expect.equals(0, (m as MC).value);

  E e1 = E.e2 << .two;
  Expect.equals(E.e0, e1);

  E e2 = E.e2 << .e1;
  Expect.equals(E.e0, e2);

  ET et = ET(3) << .two;
  Expect.equals(12, et.v);
}
