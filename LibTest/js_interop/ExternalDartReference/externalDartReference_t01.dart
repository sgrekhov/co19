// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An opaque reference to a Dart object that can be passed to
/// JavaScript.
///
/// The reference representation depends on the underlying platform. When
/// compiling to JavaScript, a Dart object is a JavaScript object, and can be
/// used directly without any conversions. When compiling to Wasm, an internal
/// Wasm function is used to convert the Dart object to an opaque JavaScript
/// value, which can later be converted back using another internal function.
/// The underlying representation type is nullable, meaning a non-nullable
/// [ExternalDartReference] may be `null`.
///
/// This interface is a faster alternative to [JSBoxedDartObject] by not
/// wrapping the Dart object with a JavaScript object. However, unlike
/// [JSBoxedDartObject], this value belongs to the Dart runtime, and therefore
/// can not be used as a JS type. This means users cannot declare interop types
/// using this as the representation type or declare interop members on this
/// type. This type is also not a subtype of JSAny. This type can only be used
/// as parameter and return types of external JavaScript interop members or
/// callbacks. Use [JSBoxedDartObject] to avoid those limitations.
///
/// Besides these differences, [ExternalDartReference] operates functionally the
/// same as [JSBoxedDartObject]. Use it to pass Dart objects within the same
/// runtime through JavaScript. There are no usable members in the resulting
/// [ExternalDartReference].
///
/// @description Check that native Dart object can be passed to JS and received
/// back.
/// @author sgrekhov22@gmail.com

import 'dart:js_interop';
import 'dart:js_interop_unsafe';
import '../../../Utils/expect.dart';
import '../js_utils.dart';

class C {
  int id;
  String name;
  C(this.id, this.name);
}

@JS()
external ExternalDartReference<C> getCfromJS();

@JS()
external void passCtoJS(ExternalDartReference<C> c);

main() {
  eval(r'''
    function passCtoJS(c) {
      globalThis.jsC = c;
    }
    
    function getCfromJS() {
      return globalThis.jsC;
    }
  ''');
  C c = C(42, "Object from Dart");
  passCtoJS(c.toExternalReference);
  ExternalDartReference<C> jsC = getCfromJS();

  C fromJS = jsC.toDartObject;
  Expect.equals(c.id, fromJS.id);
  Expect.equals(c.name, fromJS.name);
  Expect.identical(c, fromJS);
}
