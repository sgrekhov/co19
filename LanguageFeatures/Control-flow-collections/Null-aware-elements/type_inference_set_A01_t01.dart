// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When type inference is flowing through a brace-delimited
/// collection literal, it is applied to each element. The existing type
/// inference behavior is mostly unchanged by this proposal. We add two new
/// clauses to handle null-aware elements:
///
/// To infer the type of `element` in context `P`:
/// - If `element` is a `nullAwareExpressionElement` with expression `e1`:
///   - If `P` is `_` (the unknown context):
///     - Let `U` be the inferred type of the expression `e1` in context `_`.
///   - Else, `P` is `Set<Ps>`:
///     - Let `U` be the inferred type of the expression `e1` in context `Ps?`.
///       The expression has a nullable context type because it may safely
///       evaluate to `null` even when the surrounding set doesn't allow that
///       because the `?` will discard a `null` entry.
///   - The inferred set element type is `NonNull(U)`. The value added to the
///     set will never be `null`.
///
/// @description Check that the inferred element type of element `?e1` in an
/// unknown context is `NonNull(U)`, where `U` is the inferred type of the
/// expression `e1` in an unknown context.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=null-aware-elements

import '../../../Utils/static_type_helper.dart';

main() {
  var e1 = 2 > 1 ? "e1" : null;

  var set1 = {
    ?e1,
    ?null
  };
  set1.expectStaticType<Exactly<Set<String>>>();
}
