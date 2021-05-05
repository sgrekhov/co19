/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic type alias is a declaration [D] of one of the following
 * forms:
 *    m typedef id<X1extendsB1, ..., Xs extendsBs> = T;
 * ...
 * where [m] is derived from metadata, [T] is a type, and [S?] is a type or the
 * empty string.
 * @description Checks that constant generic class constructor can be used as
 * metadata with generic metadata type argument in the recent dart versions.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=generic-metadata

class C<T> { const C(); }

@C() typedef G = void Function();
@C<int>() typedef K = void Function();

main() {}