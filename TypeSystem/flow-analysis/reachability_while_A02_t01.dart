// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion while statement: If `N` is a while statement of the form
/// `while (E) S` then:
/// - Let `before(E) = conservativeJoin(before(N), assignedIn(N), capturedIn(N))`
/// - Let `before(S) = split(true(E))`.
/// - Let `after(N) = inheritTested(join(false(E), unsplit(break(S))), after(S))`
///
/// @description Checks that if `E` is not a boolean literal flow analysis
/// detects assignment in `S`.
/// @author sgrekhov22@gmail.com

main() {
  try {
    late int i;
    while (1 > 2) {
      i = 42;
    }
    i; // Not definitely unassigned
  } catch (_) {}
}
