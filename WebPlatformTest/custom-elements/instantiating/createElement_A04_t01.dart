/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
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
 * @assertion If TYPE is not the same as localName, set the value of ELEMENT's
 * is attribute to TYPE.
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

main() {
  var elements = HTML5_ELEMENTS.toSet().difference(HTML5_DOCUMENT_ELEMENTS.toSet());
  elements.remove('time');
  
  // Foo* classes and getFooClass are defined in testcommon.dart

  for (var element in elements) {
    var name = 'x-foo-$element';
    document.register(name, getFooClass(name), extendsTag: element);
    var x = document.createElement(element, name); 
    Expect.equals(name, x.getAttribute('is'));
  }
}
