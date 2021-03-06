/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks if checkValidity() returns correctly a false
 * (meaning error) result on invalid elements, and returns a true result on a
 * blank but valid elements. Blank but non-placeholder label options are valid.
 * @static-warning
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <form method="get">
      <input id="input-empty" name="victim" type="text" required/>
      <input id="input-pattern-mismatch" name="victim" type="text" pattern="Lorem ipsum" value="Loremipsum"/>
      <textarea id="textarea" name="victim" required></textarea>
      <select id="select-no-explicit-value" required>
        <option>empty</option>
        <option>another</option>
      </select>
      <select id="select-placeholder" name="victim" required>
        <option value="" selected />
        <option value="X">X</option>
      </select>
      <select id="select-non-placeholder" name="victim" required>
        <option value="X">X</option>
        <option value="" selected />
      </select>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  checkValidityFor(id) {
    return document.getElementById(id).checkValidity();
  }

  shouldBeFalse(checkValidityFor("input-empty"));
  shouldBeFalse(checkValidityFor("input-pattern-mismatch"));
  shouldBeFalse(checkValidityFor("textarea"));
  shouldBeTrue(checkValidityFor("select-no-explicit-value"));
  shouldBeFalse(checkValidityFor("select-placeholder"));
  shouldBeTrue(checkValidityFor("select-non-placeholder"));
}
