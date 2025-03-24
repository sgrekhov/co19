// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion do while statement: If `N` is a do while statement of the form
/// `do S while (E)` then:
/// - Let `before(S) = conservativeJoin(before(N), assignedIn(N), capturedIn(N))`.
/// - Let `before(E) = join(after(S), continue(N))`
/// - Let `after(N) = join(false(E), break(S))`
///
/// @description Checks that `before(E) = join(after(S), continue(N))`. Test
/// that if `S` has a `return` then an assignment in `E` will never happen.
/// @author sgrekhov22@gmail.com

main() {
  late int i;
  if (1 > 2) {
    do {
      return;
    } while ((i = 42) < 0);
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}
