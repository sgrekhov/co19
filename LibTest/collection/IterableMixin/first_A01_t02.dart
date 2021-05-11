// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion E first
/// @description Checks that [first] returns a first element
/// @author iarkh@unipro.ru

import "../../../Utils/expect.dart";
import "dart:collection";

class NaturalIterator implements Iterator<int> {
  int _current = 0;
  NaturalIterator();

  bool moveNext() {
    if (_current < 10) {
      _current++;
      return true;
    } else {
      return false;
    }
  }
  int get current => _current;
}

class MyIterable extends Object with IterableMixin {
  MyIterable();
  Iterator<int> get iterator {
    return new NaturalIterator();
  }
}

main() {
  dynamic iterable = new MyIterable();
  Expect.equals(1, iterable.first);
}
