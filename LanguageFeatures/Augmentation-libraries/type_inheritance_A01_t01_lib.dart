// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmenting declaration may have no type annotations for a
/// return type, variable type, parameter type, or type parameter bound type. In
/// the last case, that includes omitting the `extends` keyword. For a variable
/// or parameter, a `var` keyword may replace the type.
///
/// @description Check that augmenting declaration may have no type annotations
/// for a return type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,enhanced-parts

part of 'type_inheritance_A01_t01.dart';

augment get topLevelGetter;
augment topLevelFunction() => "Augmented top-level function";

augment class C {
  augment static get staticGetter;
  augment static staticMethod() => "Augmented static method";
  augment get instanceGetter => "Augmented instance getter";
  augment instanceMethod();
}

augment mixin M {
  augment static get staticGetter;
  augment static staticMethod() => "Augmented static method";
  augment get instanceGetter => "Augmented instance getter";
  augment instanceMethod();
}

augment enum E {
  ;
  augment static get staticGetter;
  augment static staticMethod() => "Augmented static method";
  augment get instanceGetter => "Augmented instance getter";
  augment instanceMethod();
}

augment extension Ext {
  augment static get staticGetter;
  augment static staticMethod() => "Augmented static method";
  augment get instanceGetter => "Augmented instance getter";
  augment instanceMethod();
}

augment extension type ET {
  augment static get staticGetter;
  augment static staticMethod() => "Augmented static method";
  augment get instanceGetter => "Augmented instance getter";
  augment instanceMethod();
  augment get id => 42;
}
