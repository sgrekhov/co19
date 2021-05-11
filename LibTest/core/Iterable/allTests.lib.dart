// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion abstract class Iterable<E>
/// @description Checks all methods of Iterable
/// @author sgrekhov@unipro.ru

library allTests_A01_t01;

import "any_A01_t01.test.dart" as any_A01_t01;
import "any_A01_t02.test.dart" as any_A01_t02;
import "any_A01_t03.test.dart" as any_A01_t03;
import "any_A01_t04.test.dart" as any_A01_t04;
import "any_A01_t05.test.dart" as any_A01_t05;
import "any_A02_t01.test.dart" as any_A02_t01;
import "contains_A01_t01.test.dart" as contains_A01_t01;
import "elementAt_A01_t01.test.dart" as elementAt_A01_t01;
import "elementAt_A02_t01.test.dart" as elementAt_A02_t01;
import "every_A01_t01.test.dart" as every_A01_t01;
import "every_A01_t02.test.dart" as every_A01_t02;
import "every_A02_t01.test.dart" as every_A02_t01;
import "every_A02_t02.test.dart" as every_A02_t02;
import "every_A03_t01.test.dart" as every_A03_t01;
import "every_A04_t01.test.dart" as every_A04_t01;
import "expand_A01_t01.test.dart" as expand_A01_t01;
import "expand_A01_t02.test.dart" as expand_A01_t02;
import "expand_A02_t01.test.dart" as expand_A02_t01;
import "expand_A02_t02.test.dart" as expand_A02_t02;
import "first_A01_t01.test.dart" as first_A01_t01;
import "first_A01_t02.test.dart" as first_A01_t02;
import "first_A02_t01.test.dart" as first_A02_t01;
import "first_A03_t01.test.dart" as first_A03_t01;
import "firstWhere_A01_t01.test.dart" as firstWhere_A01_t01;
import "firstWhere_A02_t01.test.dart" as firstWhere_A02_t01;
import "firstWhere_A03_t01.test.dart" as firstWhere_A03_t01;
import "firstWhere_A04_t01.test.dart" as firstWhere_A04_t01;
import "fold_A01_t01.test.dart" as fold_A01_t01;
import "fold_A01_t01.test.dart" as fold_A01_t02;
import "forEach_A01_t01.test.dart" as forEach_A01_t01;
import "forEach_A01_t02.test.dart" as forEach_A01_t02;
import "forEach_A02_t01.test.dart" as forEach_A02_t01;
import "isEmpty_A01_t01.test.dart" as isEmpty_A01_t01;
import "isNotEmpty_A01_t01.test.dart" as isNotEmpty_A01_t01;
import "iterator_A01_t01.test.dart" as iterator_A01_t01;
import "iterator_A02_t01.test.dart" as iterator_A02_t01;
import "iterator_A02_t02.test.dart" as iterator_A02_t02;
import "iterator_A03_t01.test.dart" as iterator_A03_t01;
import "iterator_A03_t02.test.dart" as iterator_A03_t02;
import "join_A01_t01.test.dart" as join_A01_t01;
import "join_A01_t02.test.dart" as join_A01_t02;
import "last_A01_t01.test.dart" as last_A01_t01;
import "last_A02_t01.test.dart" as last_A02_t01;
import "lastWhere_A01_t01.test.dart" as lastWhere_A01_t01;
import "lastWhere_A02_t01.test.dart" as lastWhere_A02_t01;
import "lastWhere_A03_t01.test.dart" as lastWhere_A03_t01;
import "lastWhere_A04_t01.test.dart" as lastWhere_A04_t01;
import "length_A01_t01.test.dart" as length_A01_t01;
import "map_A01_t01.test.dart" as map_A01_t01;
import "map_A01_t02.test.dart" as map_A01_t02;
import "map_A02_t01.test.dart" as map_A02_t01;
import "map_A03_t01.test.dart" as map_A03_t01;
import "reduce_A01_t01.test.dart" as reduce_A01_t01;
import "single_A01_t01.test.dart" as single_A01_t01;
import "singleWhere_A01_t01.test.dart" as singleWhere_A01_t01;
import "singleWhere_A02_t01.test.dart" as singleWhere_A02_t01;
import "singleWhere_A02_t02.test.dart" as singleWhere_A02_t02;
import "skip_A01_t01.test.dart" as skip_A01_t01;
import "skip_A02_t01.test.dart" as skip_A02_t01;
import "skip_A03_t01.test.dart" as skip_A03_t01;
import "skipWhile_A01_t01.test.dart" as skipWhile_A01_t01;
import "skipWhile_A02_t01.test.dart" as skipWhile_A02_t01;
import "skipWhile_A03_t01.test.dart" as skipWhile_A03_t01;
import "skipWhile_A04_t01.test.dart" as skipWhile_A04_t01;
import "skipWhile_A05_t01.test.dart" as skipWhile_A05_t01;
import "take_A01_t01.test.dart" as take_A01_t01;
import "take_A02_t01.test.dart" as take_A02_t01;
import "take_A03_t01.test.dart" as take_A03_t01;
import "takeWhile_A01_t01.test.dart" as takeWhile_A01_t01;
import "takeWhile_A02_t01.test.dart" as takeWhile_A02_t01;
import "takeWhile_A03_t01.test.dart" as takeWhile_A03_t01;
import "takeWhile_A04_t01.test.dart" as takeWhile_A04_t01;
import "toList_A01_t01.test.dart" as toList_A01_t01;
import "toList_A01_t02.test.dart" as toList_A01_t02;
import "toList_A01_t03.test.dart" as toList_A01_t03;
import "toSet_A01_t01.test.dart" as toSet_A01_t01;
import "where_A01_t01.test.dart" as where_A01_t01;
import "where_A01_t02.test.dart" as where_A01_t02;
import "where_A01_t03.test.dart" as where_A01_t03;
import "where_A01_t05.test.dart" as where_A01_t05;
import "where_A01_t06.test.dart" as where_A01_t06;
import "where_A01_t07.test.dart" as where_A01_t07;
import "where_A01_t08.test.dart" as where_A01_t08;
import "where_A02_t01.test.dart" as where_A02_t01;
import "where_A03_t01.test.dart" as where_A03_t01;
import "where_A04_t01.test.dart" as where_A04_t01;

test(Iterable create([Iterable? content]), {bool isSet:false}) {
  any_A01_t01.test(create);
  any_A01_t02.test(create);
  any_A01_t03.test(create);
  any_A01_t04.test(create);
  any_A01_t05.test(create);
  any_A02_t01.test(create);
  contains_A01_t01.test(create);
  elementAt_A01_t01.test(create, isSet: isSet);
  elementAt_A02_t01.test(create);
  every_A01_t01.test(create);
  every_A01_t02.test(create);
  every_A02_t01.test(create);
  every_A02_t02.test(create);
  every_A03_t01.test(create);
  every_A04_t01.test(create);
  expand_A01_t01.test(create);
  expand_A01_t02.test(create);
  expand_A02_t01.test(create);
  expand_A02_t02.test(create);
  first_A01_t01.test(create);
  first_A01_t02.test(create, isSet: isSet);
  first_A02_t01.test(create);
  first_A03_t01.test(create);
  firstWhere_A01_t01.test(create, isSet: isSet);
  firstWhere_A02_t01.test(create);
  firstWhere_A03_t01.test(create);
  firstWhere_A04_t01.test(create, isSet: isSet);
  fold_A01_t01.test(create);
  fold_A01_t02.test(create);
  forEach_A01_t01.test(create);
  forEach_A01_t02.test(create);
  forEach_A02_t01.test(create);
  isEmpty_A01_t01.test(create);
  isNotEmpty_A01_t01.test(create);
  iterator_A01_t01.test(create, isSet: isSet);
  iterator_A02_t01.test(create);
  iterator_A02_t02.test(create);
  iterator_A03_t01.test(create);
  iterator_A03_t02.test(create);
  join_A01_t01.test(create);
  join_A01_t02.test(create);
  last_A01_t01.test(create, isSet: isSet);
  last_A02_t01.test(create);
  lastWhere_A01_t01.test(create);
  lastWhere_A02_t01.test(create);
  lastWhere_A03_t01.test(create);
  lastWhere_A04_t01.test(create, isSet: isSet);
  length_A01_t01.test(create, isSet:isSet);
  map_A01_t01.test(create);
  map_A01_t02.test(create);
  map_A02_t01.test(create);
  map_A03_t01.test(create);
  reduce_A01_t01.test(create);
  single_A01_t01.test(create);
  singleWhere_A01_t01.test(create);
  singleWhere_A02_t01.test(create);
  singleWhere_A02_t02.test(create, isSet:isSet);
  skip_A01_t01.test(create);
  skip_A02_t01.test(create);
  skip_A03_t01.test(create);
  skipWhile_A01_t01.test(create);
  skipWhile_A02_t01.test(create);
  skipWhile_A03_t01.test(create);
  skipWhile_A04_t01.test(create);
  skipWhile_A05_t01.test(create);
  take_A01_t01.test(create);
  take_A02_t01.test(create);
  take_A03_t01.test(create);
  takeWhile_A01_t01.test(create);
  takeWhile_A02_t01.test(create);
  takeWhile_A03_t01.test(create);
  takeWhile_A04_t01.test(create);
  toList_A01_t01.test(create);
  toList_A01_t02.test(create);
  toList_A01_t03.test(create);
  toSet_A01_t01.test(create);
  where_A01_t01.test(create);
  where_A01_t02.test(create);
  where_A01_t03.test(create);
  where_A01_t05.test(create);
  where_A01_t06.test(create);
  where_A01_t07.test(create, isSet:isSet);
  where_A01_t08.test(create);
  where_A02_t01.test(create);
  where_A03_t01.test(create);
  where_A04_t01.test(create);
}
