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
/**
 * after web-platform-tests/html/dom/documents/dom-tree-accessors/document.getElementsByName/document.getElementsByName-id.html
 * @assertion http://www.whatwg.org/html5/#dom-document-getelementsbyname
 * @description getElementsByName and ids
 */
import 'dart:html';
import "../../../../Utils/expectWeb.dart";

const String htmlEL='''
<div id="test">
<div id="abcd"></div>
</div>
''';
         
void main() {
  document.body.appendHtml(htmlEL);
  assert_equals(document.getElementsByName("abcd").length, 0);
}
