// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All imports and exports of the same URI in a Dart program denotes
/// the same library, and imports or exports of different URIs denote distinct
/// libraries.
///
/// @description Checks that imports of the same URI in a Dart program denotes
/// the same library. Test deferred library.
/// @author sgrekhov22@gmail.com

import 'same_uri_common_lib.dart' deferred as l6prefix;

Future<void> lib6Load() => l6prefix.loadLibrary();

int get lib6Increment => l6prefix.increment;

int get lib6Counter => l6prefix.counter;
