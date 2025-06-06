// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For now (May, 2025) promotion in switch statement and
/// expressions are not specified yet. Informal spec:
/// https://github.com/dart-lang/co19/pull/3169#issuecomment-2885167786
/// TODO (sgrekhov): update when specified
///
/// @description Checks that pattern match doesn't promote the variable when a
/// case scope is shared and cases have different types.
/// @author sgrekhov22@gmail.com

import '../../Utils/static_type_helper.dart';

test1(Object? x) {
  if (x is Object) {
    switch (x) {
      case int v:
      case num _:
        x.expectStaticType<Exactly<Object>>();
      case _:
        x.expectStaticType<Exactly<Object>>();
    }
  }
}

test2(Object? x) {
  switch (x) {
    case num _ && int v:
    case Object _ && int v: // ignore: unreachable_switch_case
      x.expectStaticType<Exactly<int>>();
    case _:
      x.expectStaticType<Exactly<Object?>>();
  }
}

test3(Object? x) {
  switch (x) {
    case num _ && int v:
    case Object v && num _: // ignore: unreachable_switch_case
      x.expectStaticType<Exactly<num>>();
    case _:
      x.expectStaticType<Exactly<Object?>>();
  }
}

main() {
  test1(1);
  test1(null);
  test2(1);
  test2(null);
  test3(1);
  test3(null);
}
