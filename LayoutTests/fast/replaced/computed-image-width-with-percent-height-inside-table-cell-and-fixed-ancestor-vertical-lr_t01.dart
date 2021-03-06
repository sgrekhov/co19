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
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
    <style>
        img { height: 100%; }
        div { display: table; height: auto; }
        body { height: 400px; }
''';

const String htmlEL2 = '''
    The square below should be 100px by 100px.
    <!-- https://bugs.webkit.org/show_bug.cgi?id=103812 -->
    <!-- In strict mode, an image with height set to 100% and a fixed height ancestor should expand to its instrinsic height and width. -->
    <!-- Percentage height "is calculated with respect to the height of the generated box's containing block." --> 
    <br>
    <div style="-webkit-writing-mode: vertical-lr;">
        <img id="img" src="$testSuiteRoot/fast/replaced/resources/square-blue-100x100.png" data-expected-height=100>
    </div>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    document.getElementById('img').onLoad.listen((e) {
        checkLayout('img');
    });
}
