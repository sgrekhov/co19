/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Node append(Node newChild)
 * Adds a node to the end of the child nodes list of this node.
 * @description Checks expected lastChild after append
 */
import "dart:html";
import "../../../Utils/expect.dart";

main() {
  var x = new Element.html('<span></span>');
  var y = new DivElement();
  x.append(y);
  Expect.equals(y, x.lastChild);

  y = new Text('text');
  x.append(y);
  Expect.equals(y, x.lastChild);
}
