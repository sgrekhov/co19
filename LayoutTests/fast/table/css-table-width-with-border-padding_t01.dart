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
.tableContentBox, .tablePaddingBox, .tableBorderBox {
    display: table;
    padding-left: 100px;
    border: 3px solid teal;
    font-family: Ahem;
}
.tableContentBox {
    -webkit-box-sizing: content-box;
    box-sizing: content-box;
}
.tablePaddingBox {
    -webkit-box-sizing: padding-box;
    box-sizing: padding-box;
}
.tableBorderBox {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.tablerow {
    display: table-row;
}
.tablecell {
    display: table-cell;
}
</style>
''';

const String htmlEL2 = r'''
<div>Test for Bugzilla bug:<a href="https://bugs.webkit.org/show_bug.cgi?id=77028"> 77028</a>  Specified width CSS tables should not include border and padding as part of that width.</div>
<div>For a CSS table with a specified width, border and padding should not be included as part of its width (for the content-box model).</div>
<div style="width: 600px; border: solid 1px black;">
    <!-- For box-sizing: content-box -->
    <div style="width: 50%;" class="tableContentBox" data-expected-width="406">
        <div class="tablerow">
            <div class="tablecell">50%, content-box</div>
        </div>
    </div>
    <div style="width: 300px;" class="tableContentBox" data-expected-width="406">
        <div class="tablerow">
            <div class="tablecell">300px, content-box</div>
        </div>
    </div>
    <div style="width: 50vw;" class="tableContentBox" data-expected-width="506">
        <div class="tablerow">
            <div class="tablecell">50vw, content-box</div>
        </div>
    </div>
    <div style="width: 30em;" class="tableContentBox" data-expected-width="586">
        <div class="tablerow">
            <div class="tablecell">30em, content-box</div>
        </div>
    </div>    
    <!-- For box-sizing: border-box -->
    <div style="width: 50%;" class="tableBorderBox" data-expected-width="300">
        <div class="tablerow">
            <div class="tablecell">50%, border-box</div>
        </div>
    </div>
    <div style="width: 300px;" class="tableBorderBox" data-expected-width="300">
        <div class="tablerow">
            <div class="tablecell">300px, border-box</div>
        </div>
    </div>
    <div style="width: 50vw;" class="tableBorderBox" data-expected-width="400">
        <div class="tablerow">
            <div class="tablecell">50vw, border-box</div>
        </div>
    </div>
    <div style="width: 30em;" class="tableBorderBox" data-expected-width="480">
        <div class="tablerow">
            <div class="tablecell">30em, border-box</div>
        </div>
    </div>    
    <!-- For box-sizing: padding-box. Currently not supported hence the following expected values are incorrect.
         The expected width value for each of the following tables should be lesser by 100px.
         This is because in case of padding-box, padding is included as part of the specified
         width but border or margin are not. -->
    <div style="width: 50%;" class="tablePaddingBox" data-expected-width="406">
        <div class="tablerow">
            <div class="tablecell">50%, padding-box</div>
        </div>
    </div>
    <div style="width: 300px;" class="tablePaddingBox" data-expected-width="406">
        <div class="tablerow">
            <div class="tablecell">300px, padding-box</div>
        </div>
    </div>
    <div style="width: 50vw;" class="tablePaddingBox" data-expected-width="506">
        <div class="tablerow">
            <div class="tablecell">50vw, padding-box</div>
        </div>
    </div>
    <div style="width: 30em;" class="tablePaddingBox" data-expected-width="586">
        <div class="tablerow">
            <div class="tablecell">30em, padding-box</div>
        </div>
    </div>    
</div>
''';

void runTest(e) {
    checkLayout('.tableContentBox');
    checkLayout('.tablePaddingBox');
    checkLayout('.tableBorderBox');
}

void main() {
    document.head.appendHtml(htmlEL1);
    document.body.appendHtml(htmlEL2);
    window.onLoad.listen(runTest);
}
