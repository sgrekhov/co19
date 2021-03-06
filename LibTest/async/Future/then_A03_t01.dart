/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future then(onValue(T value), {onError(Object asyncError)})
 * If the invoked callback returns a Future f2 then f and f2 are chained.
 * That is, f is completed with the completion value of f2.
 * @description Checks that f and f2 are chained.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

main() {
  Completer completer = new Completer();
  Future f = completer.future;
  
  Completer completer2 = new Completer();
  Future f2 = completer2.future;

  asyncStart();
  Future f1=f.then((fValue) {
    asyncEnd();
    return f2;
  });

  int res=null;
  Object err=null;
  Future f3=f1.then(
    (int fValue) {res = fValue;}, 
     onError: (Object e){err = e;}
   );
     
  runAfter(f3, (){
    Expect.equals(2, res);
    Expect.equals(null, err);
  });

  completer.complete();
  completer2.complete(2);
}
