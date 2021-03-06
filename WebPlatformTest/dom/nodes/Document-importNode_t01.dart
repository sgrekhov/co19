/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/*
 * after web-platform-tests/dom/nodes/Document-importNode.html
 * <link rel=help href="http://dvcs.w3.org/hg/domcore/raw-file/tip/Overview.html#dom-document-importnode">
 *
 * @assertion Node importNode(Node node, [bool deep])
 *
 * @description 
 * @note spec difference: dart refers to https://developer.mozilla.org/en-US/docs/Web/API/document.importNode
 * where default for "deep" argument is false, while dvcs.w3.org says it is true.
 */

import 'dart:html';
import "../../Utils/expectWeb.dart";

void main() {

test(() {
  var doc = document.implementation.createHtmlDocument("Title");
  var div = doc.body.append(doc.createElement("div"));
  div.append(doc.createElement("span"));
  assert_equals(div.ownerDocument, doc, "eq1");
  assert_equals(div.firstChild.ownerDocument, doc, "eq2");
  var newDiv = document.importNode(div);
  assert_equals(div.ownerDocument, doc, "eq3");
  assert_equals(div.firstChild.ownerDocument, doc, "eq4");
  assert_equals(newDiv.ownerDocument, document, "eq5");
  assert_equals(newDiv.firstChild, null, "eq6");
}, "No 'deep' argument.");

test(() {
  var doc = document.implementation.createHtmlDocument("Title");
  var div = doc.body.append(doc.createElement("div"));
  div.append(doc.createElement("span"));
  assert_equals(div.ownerDocument, doc, "eq1");
  assert_equals(div.firstChild.ownerDocument, doc, "eq2");
  var newDiv = document.importNode(div, true);
  assert_equals(div.ownerDocument, doc, "eq3");
  assert_equals(div.firstChild.ownerDocument, doc, "eq4");
  assert_equals(newDiv.ownerDocument, document, "eq5");
  assert_equals(newDiv.firstChild.ownerDocument, document, "eq6");
}, "True 'deep' argument.");

test(() {
  var doc = document.implementation.createHtmlDocument("Title");
  var div = doc.body.append(doc.createElement("div"));
  div.append(doc.createElement("span"));
  assert_equals(div.ownerDocument, doc, "eq1");
  assert_equals(div.firstChild.ownerDocument, doc, "eq2");
  var newDiv = document.importNode(div, false);
  assert_equals(div.ownerDocument, doc, "eq3");
  assert_equals(div.firstChild.ownerDocument, doc, "eq4");
  assert_equals(newDiv.ownerDocument, document, "eq5");
  assert_equals(newDiv.firstChild, null, "eq6");
}, "False 'deep' argument.");

checkTestFailures();
}
