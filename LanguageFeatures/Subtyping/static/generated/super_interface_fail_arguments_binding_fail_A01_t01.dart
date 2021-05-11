// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Super-Interface: T0 is an interface type with super-interfaces S0,...Sn
/// - and Si <: T1 for some i
/// @description Check that if there is no i, such that Si <: T1, then T0 is not
/// subtype of T1
/// @author sgrekhov@unipro.ru
///
/// @description Check that if type T0 not a subtype of a type T1, then it cannot
/// be used as an argument of type T1. Global function required argument is
/// tested.
/// @author sgrekhov@unipro.ru
///
/// This test is generated from super_interface_fail_A01.dart and 
/// arguments_binding_fail_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.



class T1 {
  const T1();
}

abstract class S0 {}
abstract class S1 {}
abstract class S2 {}

abstract class T0 implements S0, S1, S2  {}

class T implements T0 {}

T0 t0Instance = new T();
T1 t1Instance = new T1();

const t1Default = const T1();




namedArgumentsFunc1(T1 t1, {T1 t2 = t1Default}) {}
positionalArgumentsFunc1(T1 t1, [T1 t2 = t1Default]) {}

class ArgumentsBindingClass {
    ArgumentsBindingClass(T1 t1) {}

    ArgumentsBindingClass.named(T1 t1, {T1 t2 = t1Default}) {}
    ArgumentsBindingClass.positional(T1 t1, [T1 t2 = t1Default]) {}

    factory ArgumentsBindingClass.fNamed(T1 t1, {T1 t2 = t1Default}) {
        return new ArgumentsBindingClass.named(t1, t2: t2);
    }
    factory ArgumentsBindingClass.fPositional(T1 t1, [T1 t2 = t1Default]) {
        return new ArgumentsBindingClass.positional(t1, t2);
    }

    static namedArgumentsStaticMethod(T1 t1, {T1 t2 = t1Default}) {}
    static positionalArgumentsStaticMethod(T1 t1, [T1 t2 = t1Default]) {}

    namedArgumentsMethod(T1 t1, {T1 t2 = t1Default}) {}
    positionalArgumentsMethod(T1 t1, [T1 t2 = t1Default]) {}

    set testSetter(T1 val) {}
}

class ArgumentsBindingClassSuper {
  ArgumentsBindingClassSuper(T1 t1) {}
}

class ArgumentsBindingDesc extends ArgumentsBindingClassSuper {
  ArgumentsBindingDesc(T0 t0) : super (t0) {}
}

main() {
  namedArgumentsFunc1(t0Instance);
  namedArgumentsFunc1(t1Instance, t2: t0Instance);
  positionalArgumentsFunc1(t0Instance);
  positionalArgumentsFunc1(t1Instance, t0Instance);
  new ArgumentsBindingClass(t0Instance);
  new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(t0Instance);
  new ArgumentsBindingClass(t1Instance).namedArgumentsMethod(t1Instance, t2: t0Instance);
  new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(t0Instance);
  new ArgumentsBindingClass(t1Instance).positionalArgumentsMethod(t1Instance, t0Instance);
  new ArgumentsBindingClass(t1Instance).testSetter = t0Instance;
  ArgumentsBindingClass.namedArgumentsStaticMethod(t0Instance);
  ArgumentsBindingClass.namedArgumentsStaticMethod(t1Instance, t2: t0Instance);
  ArgumentsBindingClass.positionalArgumentsStaticMethod(t0Instance);
  ArgumentsBindingClass.positionalArgumentsStaticMethod(t1Instance, t0Instance);
  new ArgumentsBindingClass.named(t0Instance);
  new ArgumentsBindingClass.named(t1Instance, t2: t0Instance);
  new ArgumentsBindingClass.positional(t0Instance);
  new ArgumentsBindingClass.positional(t1Instance, t0Instance);
  new ArgumentsBindingClass.fNamed(t0Instance);
  new ArgumentsBindingClass.fNamed(t1Instance, t2: t0Instance);
  new ArgumentsBindingClass.fPositional(t0Instance);
  new ArgumentsBindingClass.fPositional(t1Instance, t0Instance);
}
