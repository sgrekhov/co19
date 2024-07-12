// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The augmentation application order for a single base
/// declaration’s (validly positioned) augmentation declarations is then in
/// before order: An augmentation declaration is applied after any augmentation
/// declarations that are before it, and before augmentation declarations that
/// it is before.
///
/// This applies both to top-level declarations and to member declarations of,
/// for example, class declarations.
///
/// @description Checks augmentation application order.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_declarations_A03_t01.dart';
import augment 'augmenting_declarations_A03_t01_lib2.dart';

augment class A {
  String foo() => "Augmented A";
}
class B {}