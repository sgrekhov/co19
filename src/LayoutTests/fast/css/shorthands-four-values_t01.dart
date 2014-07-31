/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for WebKit bug 7987: Inspector displays incorrect summary
 * for padding information
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <p id="description">Test for WebKit bug <a href="https://bugs.webkit.org/show_bug.cgi?id=7987">7987</a>: Inspector displays incorrect summary for padding information</p>
      <div id="console"></div>

      <div id="tests_container">

      <div id="test0" style="padding: 20px;"></div>
      <div id="test1" style="padding: 20px 30px;"></div>
      <div id="test2" style="padding: 20px 30px; padding-left: 15px; padding-bottom: 10px;"></div>
      <div id="test3" style="padding: 20px 30px 55px; padding-bottom: 20px;"></div>

      <div id="test4" style="border-color: red; border-top-color: yellow"></div>
      <div id="test5" style="border-color: red blue; border-top-color: green"></div>
      <div id="test6" style="border-color: red green; border-top-color: blue; border-right-color: yellow;"></div>
      <div id="test7" style="border-color: red yellow green; border-right-color: blue;"></div>

      <div id="test8" style="border-width: 2px; border-right-width: 5px"></div>
      <div id="test9" style="border-width: 2px 3px; border-right-width: 4px"></div>
      <div id="test10" style="border-width: 2px 3px 5px;"></div>
      <div id="test11" style="border-width: 20px 30px 55px 60px;"></div>

      <div id="test12" style="border-style: solid; border-bottom-style: dashed"></div>
      <div id="test13" style="border-style: solid dashed; border-bottom-style: dotted;"></div>
      <div id="test14" style="border-style: solid dashed dotted; border-top-style: dotted;"></div>
      <div id="test15" style="border-top-style: dotted; border-right-style: dashed; border-bottom-style: solid;"></div>

      <div id="test16" style="margin: 20px; margin-left: 25px"></div>
      <div id="test17" style="margin: 20px 30px; margin-left: 50px;"></div>
      <div id="test18" style="margin: 20px 30px 55px; margin-left: 30px;"></div>
      <div id="test19" style=""></div>

      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var test0 = document.getElementById("test0");
  var test1 = document.getElementById("test1");
  var test2 = document.getElementById("test2");
  var test3 = document.getElementById("test3");
  var test4 = document.getElementById("test4");
  var test5 = document.getElementById("test5");
  var test6 = document.getElementById("test6");
  var test7 = document.getElementById("test7");
  var test8 = document.getElementById("test8");
  var test9 = document.getElementById("test9");
  var test10 = document.getElementById("test10");
  var test11 = document.getElementById("test11");
  var test12 = document.getElementById("test12");
  var test13 = document.getElementById("test13");
  var test14 = document.getElementById("test14");
  var test15 = document.getElementById("test15");
  var test16 = document.getElementById("test16");
  var test17 = document.getElementById("test17");
  var test18 = document.getElementById("test18");
  var test19 = document.getElementById("test19");

  shouldBeEqualToString(test0.style.padding, "20px");
  shouldBeEqualToString(test1.style.padding, "20px 30px");
  shouldBeEqualToString(test2.style.padding, "20px 30px 10px 15px");
  shouldBeEqualToString(test3.style.padding, "20px 30px");

  shouldBeEqualToString(test4.style.borderColor, "yellow red red");
  shouldBeEqualToString(test5.style.borderColor, "green blue red");
  shouldBeEqualToString(test6.style.borderColor, "blue yellow red green");
  shouldBeEqualToString(test7.style.borderColor, "red blue green yellow");

  shouldBeEqualToString(test8.style.borderWidth, "2px 5px 2px 2px");
  shouldBeEqualToString(test9.style.borderWidth, "2px 4px 2px 3px");
  shouldBeEqualToString(test10.style.borderWidth, "2px 3px 5px");
  shouldBeEqualToString(test11.style.borderWidth, "20px 30px 55px 60px");

  shouldBeEqualToString(test12.style.borderStyle, "solid solid dashed");
  shouldBeEqualToString(test13.style.borderStyle, "solid dashed dotted");
  shouldBeEqualToString(test14.style.borderStyle, "dotted dashed");
  shouldBeEqualToString(test15.style.borderStyle, "");

  shouldBeEqualToString(test16.style.margin, "20px 20px 20px 25px");
  shouldBeEqualToString(test17.style.margin, "20px 30px 20px 50px");
  shouldBeEqualToString(test18.style.margin, "20px 30px 55px");
  shouldBeEqualToString(test19.style.margin, "");

  // clean up after ourselves
  var tests_container = document.getElementById("tests_container");
  tests_container.remove();
}
