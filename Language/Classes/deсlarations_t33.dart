/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion classDefinition:
 * metadata abstract? class identifier typeParameters? (superclass mixins?)? interfaces?
 *   '{' (metadata classMemberDefinition)* '}'
 * ;
 * classMemberDefinition:
 *   declaration ';' |
 *   methodSignature functionBody
 * ;
 * declaration:
 *   constantConstructorSignature (redirection | initializers)? |
 *   constructorSignature (redirection | initializers)? |
 *   external constantConstructorSignature |
 *   external constructorSignature |
 *   (external static?)? getterSignature |
 *   (external static?)? setterSignature |
 *   external? operatorSignature |
 *   (external static?)? functionSignature |
 *   static (final | const) type? staticFinalDeclarationList |
 *   const type? staticFinalDeclarationList |
 *   final type? initializedIdentifierList |
 *   static? (var | type) initializedIdentifierList
 * ;
 * staticFinalDeclarationList:
 *   staticFinalDeclaration (', ' staticFinalDeclaration)*
 * ;
 * staticFinalDeclaration:
 *   identifier '=' expression
 * ;
 * @description Checks that it is a compile-time error when constructor is declared static.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

class C {
  static C(){}
}

main() {
  try {
    new C();
  } catch (e) {}
}
