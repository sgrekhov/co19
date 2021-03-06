/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 'columns' property with 'auto' and something else 
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL2 = r'''
      <div id="element"></div>
''';

List<List> tests =
   [["-webkit-columns:auto 3;", "auto", "3", "auto 3"],
    ["-webkit-columns:auto 10em;", "10em", "auto", "10em auto"],
    ["-webkit-columns:3 auto;", "auto", "3", "auto 3"],
    ["-webkit-columns:10em auto;", "10em", "auto", "10em auto"],
    ["-webkit-columns:7 7em; -webkit-columns:auto auto auto;", "7em", "7", "7em 7"],
    ["-webkit-columns:7 7em; -webkit-columns:10em auto auto;", "7em", "7", "7em 7"],
    ["-webkit-columns:7 7em; -webkit-columns:auto;", "auto", "auto", "auto"],
    ["-webkit-columns:7 7em; -webkit-columns:auto auto;",  "auto", "auto", "auto auto"],
    ["-webkit-columns:auto; -webkit-columns:initial;", "initial", "initial", "initial"],
    ["-webkit-columns:auto; -webkit-columns:initial initial;", "auto", "auto", "auto"],
    ["-webkit-columns:auto; -webkit-columns:inherit;", "inherit", "inherit", "inherit"],
    ["-webkit-columns:auto; -webkit-columns:inherit inherit;", "auto", "auto", "auto"],
    ["-webkit-columns:7;", "auto", "7", "7"],
    ["-webkit-columns:7em;", "7em", "auto", "7em"]];

void test1(List testData) {
    Element element=document.getElementById("element");
    element.style.cssText = testData[0];
    shouldBe(element.style.columnWidth, testData[1]);
    shouldBe(element.style.columnCount, testData[2]);
    shouldBe(element.style.columns, testData[3]);
}

void main() {
    description("Test the behavior when 'auto' is part of the 'columns' property value. See http://www.w3.org/TR/css3-multicol/#columns");
    document.body.appendHtml(htmlEL2);
    for (List testData in tests) {
        test1(testData);
    }
    checkTestFailures();
}
