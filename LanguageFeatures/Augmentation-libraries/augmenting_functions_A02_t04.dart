// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Inside the augmentation body, a special `augmented()` expression
/// may be used to execute the original function body. That expression takes an
/// argument list matching the original function's parameter list and returns
/// the function's return type.
///
/// @description Checks that inside an augmentation body of a static method
/// `augmented()` expression executes the original method body. Test an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'augmenting_functions_A02_t04_lib.dart';

String _log = "";

void clearLog() {
  _log = "";
}

enum E {
  e1;

  static String staticMethod1() {
    _log += "staticMethod1();";
    return "Original;";
  }

  static String staticMethod2(String v) {
    _log += "staticMethod2($v);";
    return "Original v=$v;";
  }

  static String staticMethod3(String v1, [String v2 = "v2 def"]) {
    _log += "staticMethod3($v1, [$v2]);";
    return "Original v1=$v1, [v2=$v2];";
  }

  static String staticMethod4(String v1, {String v2 = "v2 def"}) {
    _log += "staticMethod4($v1, {$v2});";
    return "Original v1=$v1, {v2=$v2};";
  }

  static String staticMethod5(String v1, {required String v2}) {
    _log += "staticMethod5($v1, {required $v2});";
    return "Original v1=$v1, {required v2=$v2};";
  }
}

main() {
  Expect.equals("augment;", E.e1.staticMethod1());
  Expect.equals("staticMethod1();Original;augmented;", _log);
  clearLog();

  Expect.equals("augment v=A;", E.e1.staticMethod2("A"));
  Expect.equals("staticMethod2(A);Original v=A;augmented;", _log);
  clearLog();

  Expect.equals("augment v1=B, [v2=C]", E.e1.staticMethod3("B", "C"));
  Expect.equals("staticMethod3(B, [C]);Original v1=B, [v2=C];augmented;", _log);
  clearLog();

  Expect.equals("augment v1=D, {v2=E}", E.e1.staticMethod4("D", v2: "E"));
  Expect.equals("staticMethod4(D, {E});Original v1=D, {v2=E};augmented;", _log);
  clearLog();

  Expect.equals("augment v1=F, {required v2=G}",
      E.e1.staticMethod5("F", v2: "G"));
  Expect.equals(
      "staticMethod5(F, {required G});Original v1=F, {required v2=G};" +
          "augmented;", _log);
}
