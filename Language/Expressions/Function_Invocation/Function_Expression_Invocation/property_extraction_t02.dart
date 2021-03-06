/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If ef is a property extraction expression, then i is is not a function
 * expression invocation and is instead recognized as an ordinary method invocation.
 * @description Checks that a.b(x) is parsed as a method invocation of method b() on object a,
 * not as an invocation of getter b on a followed by a function call.
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

class TestException {}

class A {
  noSuchMethod(Invocation im) {
    // member name and number of args are different for an unresolved getter
    Expect.equals(#b, im.memberName);
    Expect.equals(1, im.positionalArguments.length);
    throw new TestException();
  }
}


main()  {
  var a = new A();
  try {
    a.b(1);
    Expect.fail("TestException is expected");
  } on TestException catch(e) {}
}
