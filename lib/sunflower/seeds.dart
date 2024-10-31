// Copyright 2019 the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

import 'dart:math' as math;

const int maxSeeds = 250;

final double _tau = math.pi * 2;
final double _scaleFactor = 1 / 40;
final double _phi = (math.sqrt(5) + 1) / 2;

/// Returns the x & y coordinates for the seed that's on the outside ring of
/// the sunflower.
(double x, double y) insideSeedPosition(int index) {
  final double theta = index * _tau / _phi;
  final double r = math.sqrt(index) * _scaleFactor;

  final double x = r * math.cos(theta);
  final double y = -1 * r * math.sin(theta);

  return (x, y);
}

/// Returns the x & y coordinates for the seed that's on the inside area of
/// the sunflower.
(double x, double y) outsidePetalPosition(int index) {
  final double x = math.cos(_tau * index / (maxSeeds - 1)) * 0.9;
  final double y = math.sin(_tau * index / (maxSeeds - 1)) * 0.9;

  return (x, y);
}
