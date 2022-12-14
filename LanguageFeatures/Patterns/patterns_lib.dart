// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Defines data commonly used by Patterns tests
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

library patterns_lib;

const Zero = 0;
const Pi = 3.14;
const Answer = 42;
const Negative = -1;
const NegativePi = -3.14;
const MaxJSInt = 0x1FFFFFFFFFFFFF;
const Melody = "Lily was here";
const True = true;
const False = false;

class C0 {
  static const Zero = 0;
  static const Pi = 3.14;
  static const Answer = 42;
  static const Negative = -1;
  static const NegativePi = -3.14;
  static const MaxJSInt = 0x1FFFFFFFFFFFFF;
  static const Melody = "Lily was here";
  static const True = true;
  static const False = false;
}

enum Color {
  white,
  red,
  yellow,
  blue,
  black;
}

class Unit {
  static final tolerance = 0.001;
  final double value;
  final void Function(String s)? _logger;
  const Unit(this.value, [this._logger = null]);

  @override
  bool operator ==(Object other) {
    final _log = _logger;
    if (other is Unit) {
      if (_log != null) {
        _log("=$other;");
      }
      return (this.value - other.value).abs() <= tolerance;
    }
    if (other is int) {
      if (_log != null) {
        _log("=$other;");
      }
      return (this.value - other).abs() <= tolerance;
    }
    if (other is double) {
      if (_log != null) {
        _log("=${other.toStringAsFixed(2)};");
      }
      return (this.value - other).abs() <= tolerance;
    }
    return false;
  }

  @override
  String toString() => value.toStringAsFixed(2).replaceFirst(".00", "");
}

class Shape {
  final void Function(String s)? logFunction;
  const Shape([this.logFunction = null]);

  void _log(String toLog) {
    void Function(String s)? _l = logFunction;
    if (_l != null) {
      _l(toLog);
    }
  }

  Unit get area {
    _log("Shape.area");
    return Unit(0, logFunction);
  }

  Unit get size {
    _log("Shape.size");
    return Unit(0, logFunction);
  }
}

class Square extends Shape {
  final double length;

  const Square(this.length, [void Function(String s)? logFunction = null])
      : super(logFunction);

  @override
  Unit get area {
    _log("Square.area");
    return Unit(length * length, logFunction);
  }

  @override
  Unit get size {
    _log("Square.size");
    return Unit(length, logFunction);
  }
}

class Circle extends Shape {
  final double radius;

  const Circle(this.radius, [void Function(String s)? logFunction = null])
      : super(logFunction);

  @override
  Unit get area {
    _log("Circle.area");
    return Unit(3.14 * radius * radius, logFunction);
  }

  @override
  Unit get size {
    _log("Circle.size");
    return Unit(radius, logFunction);
  }
}

class Rectangle extends Shape {
  final double x, y;

  Rectangle(this.x, this.y, [void Function(String s)? logFunction = null])
      : super(logFunction);

  @override
  Unit get area {
    _log("Rectangle.area");
    return Unit(x * y, logFunction);
  }

  @override
  Unit get size {
    _log("Rectangle.size");
    return Unit(x, logFunction);
  }
}