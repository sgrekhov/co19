/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 * @needsreview "border" attr cannot be set to null.
 */
import "dart:html";
import "../../../Utils/expect.dart";

const String htmlEL2 = r'''
    <p>There should be a black box below. <br> 

    <table id="table" width="100%" height="100%">
        <tr>
            <td height="26"></td>
        </tr>
    </table>

    <div id="console"></div>
''';

void main() {
    document.body.appendHtml(htmlEL2);
    var table = document.getElementById("table");
//    table.setAttribute("border", null);
    table.setAttribute("border", '');
    Expect.equals("1px", document.querySelector("table").getComputedStyle().borderTopWidth);
}
