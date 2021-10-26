// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Add final int index; and final String _$name; instance variable
/// declarations to the class. (We’ll represent fresh names by prefixing with _$
/// here and below).
///
/// For each member declaration:
///
/// If the member declaration is a (necessarily const) generative constructor,
/// introduce a similar named constructor on the class with a fresh name, which
/// takes two extra leading positional arguments
/// (Name.foo(...) ↦ Name._$foo(int .., String .., ...),
/// Name(...) ↦ Name._$(int .., String .., ...)). If the constructor is
/// non-redirecting, make the two arguments this.index and this._$name. If the
/// constructor is redirecting, make them int _$index and String _$name, then
/// change the target of the redirection to the corresponding freshly-renamed
/// constructor and pass _$index and _$name as two extra initial positional
/// arguments.
/// Otherwise include the member as written.
///
/// @description Check that index cannot be overwritten
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=enhanced-enums

enum E1 {
  e1,
  e2,
  e3;

  final String index;
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2<T> {
  e1<int>(42),
  e2<String>("Lily was here"),
  e3<bool>(false);

  const E2(T t);
  final String index;
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  E1.e1;
}