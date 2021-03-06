/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description getBBox tests
 */
import "dart:html";
import "dart:svg";
import "dart:math" as Math;
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL2 = r'''
<div id="testcontainer">
<svg width="1" height="1" visibility="hidden">
<g id="g1">
    <polygon id="p1" fill="none" stroke="red" />
    <rect id="r1" x="50" y="50" width="50" height="50" fill="green" />
</g>
<g id="g2">
    <rect id="r2" x="50" y="50" width="50" height="50" fill="green" />
    <rect id="r3" x="20" y="20" width="20" height="0" fill="red" />
    <rect id="r4" x="120" y="20" width="20" height="20" fill="blue" style="display:none" />
    <ellipse id="c1" cx="20" cy="120" rx="0" ry="20" fill="black" />
    <g>
        <rect id="r5" x="120" y="120" width="-1" height="100" fill="cyan" />
    </g>
</g>
<g id="g3">
    <path id="p2" fill="none" stroke="red" />
    <rect id="r6" x="50" y="50" width="50" height="50" fill="green" />
    <!-- The following path should be included in the bbox. -->
    <path d=""/>
</g>
<g id="g4">
    <polyline id="p3" fill="none" stroke="red" />
    <rect id="r7" x="50" y="50" width="50" height="50" fill="green" />
</g>
<g id="g5">
    <path id="p4" d="M3"/>
    <rect id="r8" x="50" y="50" width="50" height="50" fill="green" />
</g>
<g id="g6">
    <polygon id="p5" points="47" fill="none" stroke="red" />
    <rect id="r9" x="50" y="50" width="50" height="50" fill="green" />
</g>
<g id="g7">
    <polyline id="p6" points="47" fill="none" stroke="red" />
    <rect id="r10" x="50" y="50" width="50" height="50" fill="green" />
</g>
<g id="g8">
    <path id="p7" d="M40 20h0" fill="none" stroke="red" />
    <rect id="r11" x="50" y="50" width="50" height="50" fill="green" />
</g>
</svg>
</div>
<div id=log></div>
''';

class MyRect implements Rect {
   num x, y, width, height;
   MyRect(this.x, this.y, this.width, this.height);
}

var epsilon = Math.pow(2, -24); // float epsilon

Rect getBBoxById(String id) {
    return (document.getElementById(id) as GraphicsElement).getBBox();
}

void assert_rect_approx_equals(Rect rect, Rect expected) {
    Expect.approxEquals(expected.x, rect.x, epsilon, "x");
    Expect.approxEquals(expected.y, rect.y, epsilon, "y");
    Expect.approxEquals(expected.width, rect.width, epsilon, "width");
    Expect.approxEquals(expected.height, rect.height, epsilon, "height");
}

void main() {
//    document.body.appendHtml(htmlEL2);
    document.body.setInnerHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    test(() {
    	assert_rect_approx_equals(getBBoxById("p1"), new MyRect(0, 0, 0, 0));
    }, "getBBox on polygon with no points attribute");
    test(() {
    	assert_rect_approx_equals(getBBoxById("p3"), new MyRect(0, 0, 0, 0));
    }, "getBBox on polyline with no points attribute");
    test(() {
    	assert_rect_approx_equals(getBBoxById("p2"), new MyRect(0, 0, 0, 0));
    }, "getBBox on path with no d attribute");
    test(() {
    	assert_rect_approx_equals(getBBoxById("p4"), new MyRect(0, 0, 0, 0));
    }, "getBBox on path with no valid path segments in d attribute");
    test(() {
    	assert_rect_approx_equals(getBBoxById("p5"), new MyRect(0, 0, 0, 0));
    }, "getBBox on polygon with no valid point in the points attribute");
    test(() {
    	assert_rect_approx_equals(getBBoxById("p6"), new MyRect(0, 0, 0, 0));
    }, "getBBox on polyline with no valid point in the points attribute");
    test(() {
    	assert_rect_approx_equals(getBBoxById("g1"), getBBoxById("r1"));
    }, "polygon doesn't contribute to parent bbox");
    test(() {
    	assert_rect_approx_equals(getBBoxById("g1"), getBBoxById("r2"));
    }, "group with hidden child");
    test(() {
    	assert_rect_approx_equals(getBBoxById("g3"), getBBoxById("r6"));
    }, "path doesn't contribute to parent bbox");
    test(() {
    	assert_rect_approx_equals(getBBoxById("g5"), getBBoxById("r8"));
    }, "path with only invalid segments doesn't contribute to parent bbox");
    test(() {
    	assert_rect_approx_equals(getBBoxById("g4"), getBBoxById("r7"));
    }, "polyline doesn't contribute to parent bbox");
    test(() {
    	assert_rect_approx_equals(getBBoxById("g6"), getBBoxById("r9"));
    }, "polygon with no valid points doesn't contribute to parent bbox");
    test(() {
    	assert_rect_approx_equals(getBBoxById("g7"), getBBoxById("r10"));
    }, "polyline with no valid points doesn't contribute to parent bbox");
    test(() {
    	assert_rect_approx_equals(getBBoxById("p7"), new MyRect(40, 20, 0, 0));
    }, "getBBox on path with no height");
    test(() {
    	assert_rect_approx_equals(getBBoxById("g8"), new MyRect(40, 20, 60, 80));
    }, "path with no height should contribute to parent bbox");

    checkTestFailures();
}
