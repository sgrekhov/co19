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
import "../../resources/check-layout.dart";

const String htmlEL1 = r'''
    <style>
    td { font: 15px/1 Ahem }
    table {border-collapse: collapse;}
    .dn {display: none;}
    .blue {background: blue;}
    .green {background: green;}
    </style>
''';

const String htmlEL2 = r'''
<h3>Test for chromium bug : <a href="https://code.google.com/p/chromium/issues/detail?id=258420">258420</a>. Table rows are incorrectly collapsed in case of hidden cells and rowspans.</h3>
<h4>A spanning cell whose rows have only empty cell(s) shouldn't have a non-zero height.</h4>
  <table>
    <tbody>
        <tr class="blue">
            <td rowspan="3">A</td>
            <td>A1</td>
            <td>A1.1</td>
        </tr>
        <tr>
            <td rowspan="2" id="a" data-expected-width = "56">A2</td>
            <td class="dn">A2.1</td>
        </tr>
        <tr>
            <td class="dn">A2.2</td>
        </tr>
        <tr class="green">
            <td colspan="3">long last row</td>
        </tr>
    </tbody>
  </table>
''';

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen((e){checkLayout('#a');});
}
