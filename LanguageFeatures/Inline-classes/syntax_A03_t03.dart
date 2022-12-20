// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A rule for <inlineClassDeclaration> is added to the grammar,
/// along with some rules for elements used in inline class declarations:
///
/// <inlineClassDeclaration> ::=
///   'inline' 'class' <typeIdentifier> <typeParameters>? <interfaces>?
///   '{'
///     (<metadata> <inlineMemberDeclaration>)*
///   '}'
///
/// <inlineMemberDeclaration> ::= <classMemberDefinition>
/// ...
/// A compile-time error occurs if the inline class does not declare any
/// instance variables, and if it declares two or more instance variables. Let
/// id be the name of unique instance variable that it declares. The declaration
/// of id must have the modifier final, and it can not have the modifier late;
/// otherwise a compile-time error occurs.
///
/// @description Checks that it is a compile-time error if an inline class
/// declares more than one instance variables
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class IC1 {
  final int id;
  final String name = "Name";
//^
// [analyzer] unspecified
// [cfe] unspecified
  IC1(this.id);
}

inline class IC2 {
  int id;
//^
// [analyzer] unspecified
// [cfe] unspecified
  final _name = "Name";

  IC2(int id) : this.id = id;
}

inline class IC3 {
  int id = 42;
//^
// [analyzer] unspecified
// [cfe] unspecified
  final name = "Name";
}

main() {
  print(IC1);
  print(IC2);
  print(IC3);
}
