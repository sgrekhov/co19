/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment a of the form v = e proceeds as follows:
 * If there is neither a local variable declaration with name v nor a setter
 * declaration with name v = in the lexical scope enclosing a, then:
 * - If a occurs inside a top level or static function (be it function, method,
 *   getter, or setter) or variable initializer, evaluation of a causes
 *   e to be  evaluated, after which a NoSuchMethodError is thrown.
 * - Otherwise, the assignment is equivalent to the assignment this.v = e.
 * Otherwise, let d be the innermost declaration whose name is v, if it exists.
 * If d is the declaration of a local variable, the expression e is evaluated
 * to an object o. Then, the variable v is bound to o. The value of the
 * assignment expression is o.
 * If d is the declaration of a library variable, the expression e is evaluated to
 * an object o. Then the setter v = is invoked with its formal parameter bound to
 * o. The value of the assignment expression is o.
 * Otherwise, if d is the declaration of a static variable in class C, then the
 * assignment is equivalent to the assignment C.v = e.
 * Otherwise, the assignment is equivalent to the assignment this.v = e.
 * @description Checks that an assignment of the form v = e where v is a variable declared
 * outside of a closure is evaluated correctly inside of it.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

class A {
  foo() {
    var i = 0;
    return () => i = i + 1;  //an assignment inside a closure
  }
}


main() {
  var f = new A().foo();
  Expect.equals(1, f());
  Expect.equals(2, f());
}
