/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test of save and restore on canvas graphics context.
 */
import "dart:html";
import "dart:math" as Math;
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var canvas = document.createElement("canvas");
  var context = canvas.getContext('2d');

  hex(number)
  {
    var hexDigits = "0123456789abcdef";
    return hexDigits[number >> 4] + hexDigits[number & 0xF];
  }

  pixel()
  {
    var imageData = context.getImageData(0, 0, 1, 1);
    return "#" + hex(imageData.data[0]) + hex(imageData.data[1]) + hex(imageData.data[2]);
  }

  var black="#000000";
  var red = "#ff0000";
  var green = "#008000";

  // (save set restore)
  context.fillStyle = "black";
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), black);

  context.save();
  context.fillStyle = "red";
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), red);

  context.restore();
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), black);


  // (save (save set restore) restore)
  context.fillStyle = "black";
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), black);

  context.save();

  context.save();
  context.fillStyle = "red";
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), red);

  context.restore();
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), black);

  context.restore();
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), black);


  // (save (save restore) set restore)
  context.fillStyle = black;
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), black);

  context.save();
  context.restore();

  context.save();
  context.fillStyle = red;
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), red);

  context.restore();
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), black);


  // (save (save (save set restore) set (save set restore) restore) restore)
  context.fillStyle = "black";
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), black);

  context.save();
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), black);

  context.save();
  context.fillStyle = red;
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), red);

  context.restore();
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), black);

  context.fillStyle = green;
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), green);

  context.save();
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), green);

  context.fillStyle = red;
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), red);

  context.restore();
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), green);

  context.restore();
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), black);

  context.restore();
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), black);


  // (save (save set (save (save set restore) restore) set restore) restore)
  context.fillStyle = black;
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), black);

  context.save();
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), black);

  context.save();
  context.fillStyle = red;
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), red);

  context.save();
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), red);

  context.save();
  context.fillStyle = green;
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), green);

  context.restore();
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), red);

  context.restore();
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), red);

  context.fillStyle = green;
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), green);

  context.restore();
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), black);

  context.restore();
  context.fillRect(0, 0, 1, 1);
  shouldBe(pixel(), black);
}
