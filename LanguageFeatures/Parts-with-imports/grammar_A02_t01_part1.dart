// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We extend the grammar of part files to allow import, export and
/// part file directives. We allow part files directives to use a configurable
/// URI like the other two. We restrict the part of directive to only allow the
/// string version.
///
/// -- Changed "<uri>" to "<configurableUri>".
/// <partDirective> ::= <metadata> `part' <configurableUri> `;'
///
/// -- Removed "<dottedIdentifier>" as option, retaining only "<uri>".
/// <partHeader> ::= <metadata> `part' `of' <uri> `;'
///
/// -- Added "<importOrExport>* <partDirective>*"
/// <partDeclaration> ::=
///   <partHeader> <importOrExport>* <partDirective>*
///   (<metadata> <topLevelDeclaration>)* <EOF>
///
/// The grammar change is small, mainly adding import, export and part
/// directives to part files.
///
/// @description Check that a `part` directive may contain a '<configurableUri>'
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part of 'grammar_A02_t01.dart';

String partId() => "part1";
