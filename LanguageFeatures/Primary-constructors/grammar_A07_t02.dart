// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion <primaryConstructorBodySignature> ::= // New rule.
///      'this' <initializers>?;
///
/// <methodSignature> ::= // Add one new alternative.
///      ...
///    | <primaryConstructorBodySignature>;
///
/// <declaration> ::= // Add one new alternative.
///      ...
///    | <primaryConstructorBodySignature>;
///
/// @description Check that it is a warning if the primary constructor is
/// private and `<primaryConstructorBodySignature>` has metadata.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

const meta = 1;

class C._(var int v) {
  @meta
// ^^^^
// [analyzer] STATIC_WARNING.INVALID_VISIBILITY_ANNOTATION
  this;
}

mixin class M._() {
  @meta
// ^^^^
// [analyzer] STATIC_WARNING.INVALID_VISIBILITY_ANNOTATION
  this;
}

enum E._(final int v) {
  e0._(0);
  @meta
// ^^^^
// [analyzer] STATIC_WARNING.INVALID_VISIBILITY_ANNOTATION
  this;
}

extension type ET._(int _) {
  @meta
// ^^^^
// [analyzer] STATIC_WARNING.INVALID_VISIBILITY_ANNOTATION
  this;
}

main() {
  print(C);
  print(M);
  print(E);
  print(ET);
}
