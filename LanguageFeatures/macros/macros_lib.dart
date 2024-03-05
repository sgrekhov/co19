// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
///
/// @description Checks
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

library macro_lib;

import 'dart:async';
import 'package:_fe_analyzer_shared/src/macros/api.dart';

macro class AddTypeMacro implements LibraryTypesMacro {
  final String className;
  const AddTypeMacro() : className = "DefaultTypeMacroAddedClass";
  const AddTypeMacro.name(this.className);

  FutureOr<void> buildTypesForLibrary(Library library, TypeBuilder builder) {
    //print(library.uri);
    DeclarationCode code = DeclarationCode.fromString("class $className {}");
    builder.declareType(className, code);
  }
}
