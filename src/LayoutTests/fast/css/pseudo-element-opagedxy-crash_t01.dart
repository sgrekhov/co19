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
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
#first-line-pagedx::first-line {
          overflow: -webkit-paged-x;
      }

#first-line-pagedy::first-line {
          overflow: -webkit-paged-y;
      }

#first-letter-pagedx::first-letter {
          overflow: -webkit-paged-x;
      }

#first-letter-pagedy::first-letter {
          overflow: -webkit-paged-y;
      }

#before-pagedx::before {
          overflow: -webkit-paged-x;
      }

#before-pagedy::before {
          overflow: -webkit-paged-y;
      }

#after-pagedx::after {
          overflow: -webkit-paged-x;
      }

#after-pagedy::after {
          overflow: -webkit-paged-y;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>This is a test for ::first-letter { overflow: -webkit-paged-y } causes crash. <a href="https://bugs.webkit.org/show_bug.cgi?id=105393">https://bugs.webkit.org/show_bug.cgi?id=105393</a></p>
      <p>This passes if it does not crash.</p>

      <div id="first-line-pagedx">PASS: overflow:-webkit-paged-x for ::first-line</div>
      <div id="first-line-pagedy">PASS: overflow:-webkit-paged-y for ::first-line</div>
      <div id="first-letter-pagedx">PASS: overflow:-webkit-paged-x for ::first-letter</div>
      <div id="first-letter-pagedy">PASS: overflow:-webkit-paged-y for ::first-letter</div>
      <div id="before-pagedx">PASS: overflow:-webkit-paged-x for ::before</div>
      <div id="before-pagedy">PASS: overflow:-webkit-paged-y for ::before</div>
      <div id="after-pagedx">PASS: overflow:-webkit-paged-x for ::after</div>
      <div id="after-pagedy">PASS: overflow:-webkit-paged-y for ::after</div>
      ''', treeSanitizer: new NullTreeSanitizer());
}
