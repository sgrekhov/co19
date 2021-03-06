/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description WebGL "Texture Complete" texture conformance test.
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <canvas id="example" width="40" height="40" style="width: 40px; height: 40px;"></canvas>
      <canvas id="canvas2d" width="16" height="16" style="width: 40px; height: 40px;"></canvas>
      <div id="console"></div>
      <script id="vshader" type="x-shader/x-vertex">
#ifdef GL_ES
      precision highp float;
#endif
      attribute vec4 vPosition;
      attribute vec2 texCoord0;
      varying vec2 texCoord;
      void main()
      {
          gl_Position = vPosition;
          texCoord = texCoord0;
      }
      </script>

      <script id="fshader" type="x-shader/x-fragment">
#ifdef GL_ES
      precision highp float;
#endif
      uniform sampler2D tex;
      varying vec2 texCoord;
      void main()
      {
          gl_FragColor = texture2D(tex, texCoord);
      }
      </script>
      ''', treeSanitizer: new NullTreeSanitizer());

  toFloatList(list) => list.map((x) => x.toDouble()).toList();
  float32list(list) => new Float32List.fromList(toFloatList(list));

  init()
  {
    debug("Checks that a texture that is not -texture-complete- does not draw if"+
        " filtering needs mips");
    debug("");

    var canvas2d = document.getElementById("canvas2d");
    var ctx2d = canvas2d.getContext("2d");
    ctx2d.fillStyle = "rgba(0,192,128,255)";
    ctx2d.fillRect(0, 0, 16, 16);

    var gl = initWebGL("example", "vshader", "fshader", [ "vPosition", "texCoord0"],
        [ 0, 0, 0, 1 ], 1);
    var program = gl.getParameter(wgl.CURRENT_PROGRAM);

    gl.disable(wgl.DEPTH_TEST);
    gl.disable(wgl.BLEND);

    var vertexObject = gl.createBuffer();
    gl.bindBuffer(wgl.ARRAY_BUFFER, vertexObject);
    gl.bufferData(wgl.ARRAY_BUFFER,
        float32list([ -1,1,0, 1,1,0, -1,-1,0,
          -1,-1,0, 1,1,0, 1,-1,0 ]),
        wgl.STATIC_DRAW);
    gl.enableVertexAttribArray(0);
    gl.vertexAttribPointer(0, 3, wgl.FLOAT, false, 0, 0);

    vertexObject = gl.createBuffer();
    gl.bindBuffer(wgl.ARRAY_BUFFER, vertexObject);
    gl.bufferData(wgl.ARRAY_BUFFER,
        float32list([ 0,0, 1,0, 0,1,
          0,1, 1,0, 1,1 ]),
        wgl.STATIC_DRAW);
    gl.enableVertexAttribArray(1);
    gl.vertexAttribPointer(1, 2, wgl.FLOAT, false, 0, 0);

    var tex = gl.createTexture();
    gl.bindTexture(wgl.TEXTURE_2D, tex);
    // 16x16 texture no mips
    gl.texImage2D(wgl.TEXTURE_2D, 0, wgl.RGBA, wgl.RGBA, wgl.UNSIGNED_BYTE, canvas2d);

    var loc = gl.getUniformLocation(program, "tex");
    gl.uniform1i(loc, 0);

    checkBuffer(r, g, b, a, msg) {
      gl.clearColor(1,1,1,1);
      gl.clear(wgl.COLOR_BUFFER_BIT | wgl.DEPTH_BUFFER_BIT);
      gl.drawArrays(wgl.TRIANGLES, 0, 6);
      gl.flush();
      var buf = new Uint8List(4 * 4 * 4);
      gl.readPixels(0, 0, 4, 4, wgl.RGBA, wgl.UNSIGNED_BYTE, buf);
      for (var i = 0; i < 4 * 4; ++i) {
        var offset = i * 4;
        var actual = buf.sublist(offset, offset+4);
        if (buf[offset + 0] != r ||
            buf[offset + 1] != g ||
            buf[offset + 2] != b ||
            buf[offset + 3] != a) {
              msg += ' Expected: $r, $g, $b, $a was: $actual';
              testFailed(msg);
              return;
            }
      }
      testPassed(msg);
    }

    checkBuffer(0,0,0,255,
        "texture that is not -texture-complete- when " +
        "TEXTURE_MIN_FILTER not NEAREST or LINEAR should draw with 0,0,0,255");
  }

  init();
}
