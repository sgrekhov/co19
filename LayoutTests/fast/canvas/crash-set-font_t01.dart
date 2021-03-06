/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for bug 66291: Crash because
 * CSSPrimitiveValue::computeLengthDouble assumes fontMetrics are available.
 * This test passed as it did not crash.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var oContext2d = document.getCssCanvasContext("2d","",0,0);
  oContext2d.font = "small-caps .0ex G";
  oContext2d.font = "italic .0ex G";
  oContext2d.font = "italic 400 .0ex G";
  oContext2d.font = "italic 400 small/.0ex G";
}
