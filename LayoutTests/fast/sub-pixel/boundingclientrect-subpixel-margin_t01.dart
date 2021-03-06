/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL2 = r'''
        <div style="margin: 0; width: 700px; margin: 10px; background: black; overflow: hidden;">
            <div id="test" style="width: 697px; height: 200px; background-color: red; margin: 0 auto"></div>
        </div>
''';

void main() {
    document.body.attributes['style']="margin: 0; padding: 0;";
    document.body.appendHtml(htmlEL2);

    var testEl = document.getElementById('test');
    var testRect = testEl.getBoundingClientRect();
    var parentRect = testEl.parent.getBoundingClientRect();

    var expectedMarginWidth = (parentRect.width - testRect.width) / 2;
    shouldBe(testRect.left - parentRect.left, expectedMarginWidth);
    shouldBe(parentRect.right - testRect.right, expectedMarginWidth);

    checkTestFailures();
}
