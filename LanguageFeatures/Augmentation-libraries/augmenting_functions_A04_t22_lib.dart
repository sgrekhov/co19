// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - The signature of the function augmentation does not exactly match the
///   original function. This means the return types must be the same; there
///   must be the same number of positional, optional, and named parameters; the
///   types of corresponding positional and optional parameters must be the
///   same; the names and types of named parameters must be the same; any type
///   parameters and bounds must be the same; and any required or covariant
///   modifiers must match.
///
/// @description Checks that it is not an error if return type and  parameters
/// of an augmentation exactly matches the original function. Test implicit
/// `dynamic`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_functions_A04_t22.dart';

augment dynamic topLevelFunction1() => "augmented";
augment String topLevelFunction2(dynamic s0) => "augmented $s0";
augment String topLevelFunction3(dynamic v) => "augmented $v";

augment class C {
  augment static dynamic staticMethod1() => "augmented";
  augment static String staticMethod2(dynamic s0) => "augmented $s0";
  augment static String staticMethod3(dynamic v) => "augmented $v";

  augment dynamic instanceMethod1() => "augmented";
  augment String instanceMethod2(dynamic s0) => "augmented $s0";
  augment String instanceMethod3(dynamic v) => "augmented $v";
}

augment mixin M {
  augment static dynamic staticMethod1() => "augmented";
  augment static String staticMethod2(dynamic s0) => "augmented $s0";
  augment static String staticMethod3(dynamic v) => "augmented $v";

  augment dynamic instanceMethod1() => "augmented";
  augment String instanceMethod2(dynamic s0) => "augmented $s0";
  augment String instanceMethod3(dynamic v) => "augmented $v";
}

augment enum E {
  augment e1;

  augment static dynamic staticMethod1() => "augmented";
  augment static String staticMethod2(dynamic s0) => "augmented $s0";
  augment static String staticMethod3(dynamic v) => "augmented $v";

  augment dynamic instanceMethod1() => "augmented";
  augment String instanceMethod2(dynamic s0) => "augmented $s0";
  augment String instanceMethod3(dynamic v) => "augmented $v";
}

augment extension Ext {
  augment static dynamic staticMethod1() => "augmented";
  augment static String staticMethod2(dynamic s0) => "augmented $s0";
  augment static String staticMethod3(dynamic v) => "augmented $v";

  augment dynamic instanceMethod1() => "augmented";
  augment String instanceMethod2(dynamic s0) => "augmented $s0";
  augment String instanceMethod3(dynamic v) => "augmented $v";
}
