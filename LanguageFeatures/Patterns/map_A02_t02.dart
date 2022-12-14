// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// mapPattern        ::= typeArguments? '{' mapPatternEntries? '}'
/// mapPatternEntries ::= mapPatternEntry ( ',' mapPatternEntry )* ','?
/// mapPatternEntry   ::= expression ':' pattern | '...'
///
/// A map pattern matches values that implement Map and accesses values by key
/// from it.
///
/// It is a compile-time error if:
///
/// typeArguments is present and there are more or fewer than two type arguments
///
/// Any of the entry key expressions are not constant expressions.
///
/// If any two keys in the map are identical. Map patterns that don't have a
/// rest element only match if the length of the map is equal to the number of
/// map entries. If a map pattern has multiple identical key entries, they will
/// increase the required length for the pattern to match but in all but the
/// most perverse Map implementations will represent the same key. Thus, it's
/// very unlikely that any map pattern containing identical keys (and no rest
/// element) will ever match. Duplicate keys are most likely a typo in the code.
///
/// Any two record keys which both have primitive == are equal. Since records
/// don't have defined identity, we can't use the previous rule to detect
/// identical records. But records do support an equality test known at compile
/// time if all of their fields do, so we use that.
///
/// There is more than one ... element in the map pattern.
///
/// The ... element is not the last element in the map pattern.
///
/// @description Check that it is a compile-time error if one typeArgument is
/// present and map pattern is empty (to ensure that we have no set pattern)
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

String test1(Object object) {
  return switch (object) {
    <int>{} => "",
//  ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    _ => "default"
  };
}

String test2(Object object) {
  switch (object) {
    case <int>{}:
//       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      return "1";
    default:
      return "default";
  }
}

void test3(Object object) {
  if (object case <int>{}) {
//                ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  test1({});
  test2({});
  test3({});
}