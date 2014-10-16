/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <style>
      .min-content {
          min-width: 10px;
          width: -webkit-min-content;
          width: -moz-min-content;
          width: -ie-min-content;
          width: -o-min-content;
          width: min-content;
      }
      </style>
      <p>The form controls of the same type below should be the same width.</p>

      <input id="text-a" class="min-content"><br>
      <input id="text-b"><br>

      <input id="file-a" type=file class="min-content"><br>
      <input id="file-b" type=file><br>

      <input id="range-a" type=range class="min-content"><br>
      <input id="range-b" type=range><br>

      <select id="select-a" class="min-content"><option>aaaaaaaaaaaaaaaaaaaaaaaaa</option></select><br>
      <select id="select-b"><option>aaaaaaaaaaaaaaaaaaaaaaaaa</option></select><br>

      <select id="multiple-a" multiple class="min-content"><option>aaaaaaaaaaaaaaaaaaaaaaaaa</option></select><br>
      <select id="multiple-b" multiple><option>aaaaaaaaaaaaaaaaaaaaaaaaa</option></select><br>
      ''', treeSanitizer: new NullTreeSanitizer());

  var ids = ['text', 'file', 'range', 'select', 'multiple'];
  ids.forEach((id) {
    shouldBe(document.getElementById(id + "-a").offsetWidth,
             document.getElementById(id + "-b").offsetWidth);
  });
}
