/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for invalid passed parameters
 */
import "dart:html";
import "dart:web_gl" as wgl;
import 'dart:typed_data';
import "../../../testcommon.dart";
import "resources/webgl-test.dart";
import "resources/webgl-test-utils.dart" as wtu;
import "resources/desktop-gl-constants.dart";
import "../../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var context = create3DContext();

  debug("Test createShader()");
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.createShader(wgl.FRAGMENT_SHADER));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.createShader(wgl.VERTEX_SHADER));
  shouldGenerateGLError(context, wgl.INVALID_ENUM, () => context.createShader(0));
  shouldGenerateGLError(context, wgl.INVALID_ENUM, () => context.createShader(wgl.TRIANGLES));

  debug("");
  debug("Test clear()");
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.clear(desktopGL['ACCUM_BUFFER_BIT']));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.clear(desktopGL['ACCUM_BUFFER_BIT'] | wgl.COLOR_BUFFER_BIT));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.clear(desktopGL['ACCUM_BUFFER_BIT'] | wgl.COLOR_BUFFER_BIT | wgl.DEPTH_BUFFER_BIT | wgl.STENCIL_BUFFER_BIT));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.clear(wgl.COLOR_BUFFER_BIT | wgl.DEPTH_BUFFER_BIT | wgl.STENCIL_BUFFER_BIT));

  debug("");
  debug("Test bufferData()");
  var buffer = context.createBuffer();
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bindBuffer(wgl.ARRAY_BUFFER, buffer));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bufferData(wgl.ARRAY_BUFFER, 16, wgl.STREAM_DRAW));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bufferData(wgl.ARRAY_BUFFER, 16, wgl.STATIC_DRAW));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bufferData(wgl.ARRAY_BUFFER, 16, wgl.DYNAMIC_DRAW));
  shouldGenerateGLError(context, wgl.INVALID_ENUM, () => context.bufferData(wgl.ARRAY_BUFFER, 16, desktopGL['STREAM_READ']));
  shouldGenerateGLError(context, wgl.INVALID_ENUM, () => context.bufferData(wgl.ARRAY_BUFFER, 16, desktopGL['STREAM_COPY']));
  shouldGenerateGLError(context, wgl.INVALID_ENUM, () => context.bufferData(wgl.ARRAY_BUFFER, 16, desktopGL['STATIC_READ']));
  shouldGenerateGLError(context, wgl.INVALID_ENUM, () => context.bufferData(wgl.ARRAY_BUFFER, 16, desktopGL['STATIC_COPY']));
  shouldGenerateGLError(context, wgl.INVALID_ENUM, () => context.bufferData(wgl.ARRAY_BUFFER, 16, desktopGL['DYNAMIC_READ']));
  shouldGenerateGLError(context, wgl.INVALID_ENUM, () => context.bufferData(wgl.ARRAY_BUFFER, 16, desktopGL['DYNAMIC_COPY']));

  debug("");
  debug("Test {copy}Tex{Sub}Image2D with negative offset/width/height");
  var tex = context.createTexture();
  var pixels = new Uint8List(2 * 2 * 4);
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bindTexture(wgl.TEXTURE_2D, tex));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.texImage2D(wgl.TEXTURE_2D, 0, wgl.RGBA, -16, -16, 0, wgl.RGBA, wgl.UNSIGNED_BYTE, null));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.texImage2D(wgl.TEXTURE_2D, 0, wgl.RGBA, 16, 16, 0, wgl.RGBA, wgl.UNSIGNED_BYTE, null));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.texSubImage2D(wgl.TEXTURE_2D, 0, -1, -1, 2, 2, wgl.RGBA, wgl.UNSIGNED_BYTE, pixels));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.texSubImage2D(wgl.TEXTURE_2D, 0, 0, 0, -1, -1, wgl.RGBA, wgl.UNSIGNED_BYTE, pixels));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.texSubImage2D(wgl.TEXTURE_2D, 0, 0, 0, 2, 2, wgl.RGBA, wgl.UNSIGNED_BYTE, pixels));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.copyTexImage2D(wgl.TEXTURE_2D, 0, wgl.RGBA, 0, 0, -1, -1, 0));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.copyTexImage2D(wgl.TEXTURE_2D, 0, wgl.RGBA, 0, 0, 16, 16, 0));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.copyTexSubImage2D(wgl.TEXTURE_2D, 0, -1, -1, 0, 0, 2, 2));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.copyTexSubImage2D(wgl.TEXTURE_2D, 0, 0, 0, 0, 0, -1, -1));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.copyTexSubImage2D(wgl.TEXTURE_2D, 0, 0, 0, 0, 0, 2, 2));

  debug("");
  debug("Test renderbufferStorage() with negative width/height");
  var renderbuffer = context.createRenderbuffer();
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.bindRenderbuffer(wgl.RENDERBUFFER, renderbuffer));
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.renderbufferStorage(wgl.RENDERBUFFER, wgl.RGBA4, -2, -2));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.renderbufferStorage(wgl.RENDERBUFFER, wgl.RGBA4, 16, 16));

  debug("");
  debug("Test scissor() with negative width/height");
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.scissor(0, 0, -2, -2));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.scissor(0, 0, 16, 16));

  debug("");
  debug("Test viewport() with negative width/height");
  shouldGenerateGLError(context, wgl.INVALID_VALUE, () => context.viewport(0, 0, -2, -2));
  shouldGenerateGLError(context, wgl.NO_ERROR, () => context.viewport(0, 0, 16, 16));

  debug("");
  debug("Set up a program to test invalid characters");
  var invalidSet = ['"', r'$', '`', '@', '\\', "'"];
  var validUniformName = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_1234567890";
  var validAttribName = "abcdefghijklmnopqrstuvwxyz_ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
  generateShaderSource({idChar, commentChar}) {
    var invalidIdentifierString = "";
    var invalidCommentString = "";
    if (idChar != null) {
      invalidIdentifierString += idChar;
    }
    if (commentChar != null) {
      invalidCommentString += commentChar;
    }
    return "uniform float " + validUniformName + invalidIdentifierString + ";\n"
      + "varying float " + validAttribName + ";\n"
      + "void main() {\n"
      + validAttribName  + " = " + validUniformName + ";\n"
      + "gl_Position = vec4(0.0, 0.0, 0.0, 1.0); }\n"
      + "//.+-/*%<>[](){}^|&~=!:;,?# " + invalidCommentString;
  }
  var vShader = context.createShader(wgl.VERTEX_SHADER);
  context.shaderSource(vShader, generateShaderSource());
  context.compileShader(vShader);
  shouldBe(context.getError(), wgl.NO_ERROR);
  var fShader = context.createShader(wgl.FRAGMENT_SHADER);
  context.shaderSource(fShader, "precision highp float;\n"
      + "varying float " + validAttribName + ";\n"
      + "void main() {\n"
      + "gl_FragColor = vec4(" + validAttribName + ", 0.0, 0.0, 1.0); }");
  context.compileShader(fShader);
  shouldBe(context.getError(), wgl.NO_ERROR);
  var program = context.createProgram();
  context.attachShader(program, vShader);
  context.attachShader(program, fShader);
  context.linkProgram(program);
  shouldBeTrue(context.getProgramParameter(program, wgl.LINK_STATUS));
  shouldBe(context.getError(), wgl.NO_ERROR);
  context.bindAttribLocation(program, 1, validAttribName);
  shouldBe(context.getError(), wgl.NO_ERROR);
  context.getAttribLocation(program, validAttribName);
  shouldBe(context.getError(), wgl.NO_ERROR);
  context.getUniformLocation(program, validUniformName);
  shouldBe(context.getError(), wgl.NO_ERROR);

  debug("");
  debug("Test shaderSource() with invalid characters");
  for (var i = 0; i < invalidSet.length; ++i) {
    var validShaderSource = generateShaderSource(commentChar:invalidSet[i]);
    context.shaderSource(vShader, validShaderSource);
    shouldBe(context.getError(), wgl.NO_ERROR);
    var invalidShaderSource = generateShaderSource(idChar:invalidSet[i]);
    context.shaderSource(vShader, invalidShaderSource);
    shouldBe(context.getError(), wgl.INVALID_VALUE);
  }

  debug("");
  debug("Test bindAttribLocation() with invalid characters");
  for (var i = 0; i < invalidSet.length; ++i) {
    var invalidName = validAttribName + invalidSet[i];
    context.bindAttribLocation(program, 1, invalidName);
    shouldBe(context.getError(), wgl.INVALID_VALUE);
  }

  debug("");
  debug("Test getAttribLocation() with invalid characters");
  for (var i = 0; i < invalidSet.length; ++i) {
    var invalidName = validAttribName + invalidSet[i];
    context.getAttribLocation(program, invalidName);
    shouldBe(context.getError(), wgl.INVALID_VALUE);
  }

  debug("");
  debug("Test getUniformLocation() with invalid characters");
  for (var i = 0; i < invalidSet.length; ++i) {
    var invalidName = validUniformName + invalidSet[i];
    context.getUniformLocation(program, invalidName);
    shouldBe(context.getError(), wgl.INVALID_VALUE);
  }
}
