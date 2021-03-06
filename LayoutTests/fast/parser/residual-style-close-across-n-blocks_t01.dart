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
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL2 = r'''
    <pre id="console"></pre>
    <div id="playground"></div>
''';

void log(message) {
    document.getElementById("console").append(new Text(message + "\n"));
}

void testParsing(markup, expected) {
    var playground = document.getElementById("playground");
//    playground.innerHtml = markup;
    playground.setInnerHtml(markup, treeSanitizer:new NullTreeSanitizer());
    var actual = playground.innerHtml;
    shouldBe(actual, expected);
    if (actual == expected)
        log("PASS: " + markup + " parsed as " + actual + " as expected.");
    else
        log("FAIL: " + markup + " parsed as " + actual + " instead of " + expected);
    playground.innerHtml = "";
}

void runTest(e) {
    // One block to cross:
    testParsing("1<i>2<div>3</i>4</div>5",
                "1<i>2</i><div><i>3</i>4</div>5");

    // One block to cross:
    testParsing("1<i><div>2</i>3</div>4",
                "1<i></i><div><i>2</i>3</div>4");

    // Non-affected block to cross:
    testParsing("1<i>2<object>3</i>4</object>5",
                "1<i>2<object>34</object>5</i>");

    // Two blocks to cross:
    testParsing("1<i>2<div>3<pre>4</i>5</pre>6</div>7",
                "1<i>2</i><div><i>3</i><pre><i>4</i>5</pre>6</div>7");

    // Now with an inline without residual style:
    testParsing("1<i>2<div>3<span>4<pre>5</i>6</pre>7</div>8",
                "1<i>2</i><div><i>3<span>4</span></i><pre><i>5</i>6</pre>7</div>8");

    // Now with residual style to restore:
    testParsing("1<i>2<div>3<pre>4<b>5</i>6</b>7</pre>8</div>9",
                "1<i>2</i><div><i>3</i><pre><i>4<b>5</b></i><b>6</b>7</pre>8</div>9");

    // Three blocks to cross:
    testParsing("1<i>2<div>3<pre>4<p>5</i>6</p>7</pre>8</div>9",
                "1<i>2</i><div><i>3</i><pre><i>4</i><p><i>5</i>6</p>7</pre>8</div>9");

    // Non-affected block in the middle:
    testParsing("1<i>2<div>3<object>4<p>5</i>6</p>7</object>8</div>9",
                "1<i>2<div>3<object>4<p>56</p>7</object>8</div>9</i>");

    // Bug 13603 reduction:
    testParsing("<a href=\"#1\"><div><div><a href=\"#2\"></a><p>Shouldn't be a link</p></div><p>Shouldn't be a link</p></div><p>Shouldn't be a link</p></a>",
                "<a href=\"#1\"></a><div><a href=\"#1\"></a><div><a href=\"#1\"></a><a href=\"#2\"></a><p>Shouldn't be a link</p></div><p>Shouldn't be a link</p></div><p>Shouldn't be a link</p>");

    // Almost bug 8750 reduction:
    testParsing("<p><a>RED</p>RED<div>RED<p>RED<a>RED</a>BLACK</p>BLACK</div>BLACK",
                "<p><a>RED</a></p><a>RED</a><div><a>RED</a><p><a>RED</a><a>RED</a>BLACK</p>BLACK</div>BLACK");

    // Bug 12808 reduction:
    testParsing("<a href=\"#outside\"><p>Outside link.</p><div><div><a href=\"#inside\">Inside link.</a></div></div><p>After all links</p>",
                "<a href=\"#outside\"><p>Outside link.</p></a><div><a href=\"#outside\"></a><div><a href=\"#outside\"></a><a href=\"#inside\">Inside link.</a></div></div><p>After all links</p>");
    
    // Bug 12861 reduction:
    testParsing("<a href=\"http://webkit.org\"><div><h3><a href=\"about:blank\">This is a link.</a></h3>This is not a link under Firefox, but it is under Safari.",
                "<a href=\"http://webkit.org\"></a><div><a href=\"http://webkit.org\"></a><h3><a href=\"http://webkit.org\"></a><a href=\"about:blank\">This is a link.</a></h3>This is not a link under Firefox, but it is under Safari.</div>");
    
    checkTestFailures();
}

void main() {
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen(runTest);
}
