/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests CanvasPathMethods arc and arcTo with negative radii.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";

main() {
  var canvas = document.createElement("canvas");
  var ctx = canvas.getContext('2d');

  shouldNotThrow(() => ctx.arc(10, 10, 5, 0, 1, false));
  shouldNotThrow(() => ctx.arc(10, 10, 0, 0, 1, false));
  shouldThrow(() => ctx.arc(10, 10, -5, 0, 1, false));

  shouldNotThrow(() => ctx.arcTo(10, 10, 20, 20, 5));
  shouldNotThrow(() => ctx.arcTo(10, 10, 20, 20, 0));
  shouldThrow(() => ctx.arcTo(10, 10, 20, 20, -5));

  //var path = new Path2D();
  var path = new Path();

  shouldNotThrow(() => path.arc(10, 10, 5, 0, 1, false));
  shouldNotThrow(() => path.arc(10, 10, 0, 0, 1, false));
  shouldThrow(() => path.arc(10, 10, -5, 0, 1, false));

  shouldNotThrow(() => path.arcTo(10, 10, 20, 20, 5));
  shouldNotThrow(() => path.arcTo(10, 10, 20, 20, 0));
  shouldThrow(() => path.arcTo(10, 10, 20, 20, -5));
}
