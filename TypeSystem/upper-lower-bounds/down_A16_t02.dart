// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We define the lower bound of two types `T1` and `T2` to be
/// DOWN(`T1`, `T2`) as follows.
/// ...
/// - DOWN(`T1`, `T2?`) = `S` where `S` is DOWN(`T1`, `T2`)
///
/// @description Check that DOWN(`T1`, `T2?`) = `S` where `S` is DOWN(`T1`, `T2`)
/// if `T1 != T2?` and the operands are not the same type and none of them is
/// TOP, BOTTOM, NULL, or OBJECT. Test that if `T1` and `T2` are not subtypes of
/// each other then `S` is DOWN(`T1`, `T2`).
/// @author sgrekhov22@gmail.com

import 'dart:async';
import '../../Utils/static_type_helper.dart';
import 'up_lib.dart';

void f1a(void Function(int) v1, void Function(String?) v2) {
  // DOWN(int, String?) = DOWN(int, String) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f1b(void Function(String) v1, void Function(int?) v2) {
  // DOWN(String, int?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2a(void Function(C) v1, void Function(String?) v2) {
  // DOWN(C, String?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f2b(void Function(String) v1, void Function(C?) v2) {
  // DOWN(String, C?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f3a(void Function(Function) v1, void Function(Record?) v2) {
  // DOWN(Function, Record?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f3b(void Function(Record) v1, void Function(Function?) v2) {
  // DOWN(Record, Function?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4a(void Function(List<int>) v1, void Function(List<String>?) v2) {
  // DOWN(List<int>, List<String>?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f4b(void Function(List<String>) v1, void Function(List<int>?) v2) {
  // DOWN(List<String>, List<int>?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5a(void Function(D<int, String>) v1, void Function(D<String, int>?) v2) {
  // DOWN(D<int, String>, D<String, int>?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f5b(void Function(D<String, int>) v1, void Function(D<int, String>?) v2) {
  // DOWN(D<String, int>, D<int, String>?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f6a(void Function((int,)) v1, void Function((String,)?) v2) {
  // DOWN((int,), (String,)?) = (Never,)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((Never,))>>();
}

void f6b(void Function((String,)) v1, void Function((int,)?) v2) {
  // DOWN((String,), (int,)?) = (Never,)
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function((Never,))>>();
}

void f7a(void Function((int,)) v1, void Function((int, String)?) v2) {
  // DOWN((int,), (int, String)?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f7b(void Function((int, String)) v1, void Function((int,)?) v2) {
  // DOWN((int, String), (int,)?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f8a(void Function(int Function()) v1, void Function(String Function()?) v2) {
  // DOWN(int Function(), String Function()?) = Never Function()
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never Function())>>();
}

void f8b(void Function(String Function()) v1, void Function(int Function()?) v2) {
  // DOWN(String Function(), int Function()?) = Never Function()
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never Function())>>();
}

void f9a(void Function(int Function(int)) v1, void Function(int Function()?) v2) {
  // DOWN(int Function(int), int Function()?) = int Function([int])
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int Function([int]))>>();
}

void f9b(void Function(int Function()) v1, void Function(int Function(int)?) v2) {
  // DOWN(int Function(), int Function(int)?) = int Function([int])
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(int Function([int]))>>();
}

void f10a(void Function(FutureOr<int>) v1, void Function(String?) v2) {
  // DOWN(FutureOr<int>, String?) = DOWN(FutureOr<int>, String) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f10b(void Function(String) v1, void Function(FutureOr<int>?) v2) {
  // DOWN(String, FutureOr<int>?) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f11a(void Function(FutureOr<int>) v1, void Function(FutureOr<String>?) v2) {
  // DOWN(FutureOr<int>, FutureOr<String>?) = FutureOr<Never>
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<Never>)>>();
}

void f11b(void Function(FutureOr<String>) v1, void Function(FutureOr<int>?) v2) {
  // DOWN(FutureOr<String>, FutureOr<int>?) = FutureOr<Never>
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(FutureOr<Never>)>>();
}

void f12a<X>(void Function(X) v1, void Function(num?) v2) {
  // DOWN(X, num?) = DOWN(X, num) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void f12b<X>(void Function(num) v1, void Function(X?) v2) {
  // DOWN(num, X?) = DOWN(num, X) = Never
  var v = (1 > 2) ? v1 : v2;
  v.expectStaticType<Exactly<void Function(Never)>>();
}

void main() {
  f1a((int x) {}, (String? x) {});
  f1b((String x) {}, (int? x) {});
  f2a((C x) {}, (String? x) {});
  f2b((String x) {}, (C? x) {});
  f3a((Function x) {}, (Record? x) {});
  f3b((Record x) {}, (Function? x) {});
  f4a((List<int> x) {}, (List<String>? x) {});
  f4b((List<String> x) {}, (List<int>? x) {});
  f5a((D<int, String> x) {}, (D<String, int>? x) {});
  f5b((D<String, int> x) {}, (D<int, String>? x) {});
  f6a(((int,) x) {}, ((String,)? x) {});
  f6b(((String,) x) {}, ((int,)? x) {});
  f7a(((int,) x) {}, ((int, String)? x) {});
  f7b(((int, String) x) {}, ((int,)? x) {});
  f8a((int Function() x) {}, (String Function()? x) {});
  f8b((String Function() x) {}, (int Function()? x) {});
  f9a((int Function(int) x) {}, (int Function()? x) {});
  f9b((int Function() x) {}, (int Function(int)? x) {});
  f10a((FutureOr<int> x) {}, (String? x) {});
  f10b((String x) {}, (FutureOr<int>? x) {});
  f11a((FutureOr<int> x) {}, (FutureOr<String>? x) {});
  f11b((FutureOr<String> x) {}, (FutureOr<int>? x) {});
  f12a<int>((int x) {}, (num? x) {});
  f12b<int>((num x) {}, (int? x) {});
}
