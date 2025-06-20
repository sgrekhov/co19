// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion JSBoolean equals( JSAny? any )
/// The result of `this == any` in JavaScript.
///
/// @description Check that `equals` returns result of `this == any` in
/// JavaScript.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../js_utils.dart';

testEquals(JSAny? underTest) {
  eval(r'''
    globalThis.eqNum = underTest == 2; 
    globalThis.eqString = underTest == "text";
    globalThis.eqNull = underTest == null;
    globalThis.eqUndefined = underTest == undefined;
    globalThis.eqNaN = underTest == (0 / 0);
    globalThis.eqArray = underTest == [1, 2];
    globalThis.eqTrue = underTest == true;
  ''');

  jsExpectEquals(globalContext["eqNum"], underTest.equals(2.toJS));
  jsExpectEquals(globalContext["eqString"], underTest.equals("text".toJS));
  jsExpectEquals(globalContext["eqNull"], underTest.equals(null));
  jsExpectEquals(globalContext["eqUndefined"], underTest.equals(null));
  jsExpectEquals(globalContext["eqNaN"], underTest.equals((0 / 0).toJS));
  jsExpectEquals(globalContext["eqArray"], underTest.equals([1, 2].jsify()));
  jsExpectEquals(globalContext["eqTrue"], underTest.equals(true.toJS));
}

main() {
  eval("globalThis.underTest = 2;");
  testEquals(2.toJS);

  eval("globalThis.underTest = 42;");
  testEquals(42.toJS);

  eval("globalThis.underTest = 'Some text';");
  testEquals('Some text'.toJS);

  eval("globalThis.underTest = null;");
  testEquals(null);

  eval("globalThis.underTest = undefined;");
  testEquals(null);

  eval("globalThis.underTest = 0 / 0;");
  testEquals((0 / 0).toJS);

  eval("globalThis.underTest = [0];");
  testEquals(<JSAny?>[].toJS);

  eval("globalThis.underTest = false;");
  testEquals(false.toJS);

  eval("globalThis.underTest = {};");
  testEquals(JSObject());
}
