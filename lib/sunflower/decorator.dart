// Copyright 2019 the Dart project authors. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'seeds.dart';

void main() {
  runApp(const Sunflower());
}

class Sunflower extends StatefulWidget {
  const Sunflower({super.key});

  @override
  State<StatefulWidget> createState() => _SunflowerState();
}

class _SunflowerState extends State<Sunflower> {
  int seeds = maxSeeds ~/ 2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(elevation: 2),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sunflower'),
        ),
        body: Column(
          spacing: 20,
          children: [
            SunflowerWidget(seeds)
              .expanded(),

            Text('Showing ${seeds.round()} seeds'),

            Slider(
              min: 1,
              max: maxSeeds.toDouble(),
              value: seeds.toDouble(),
              onChanged: (val) {
                setState(() => seeds = val.round());
              },
            ),
          ],
        )
        .sizedBox(width: 600),
      ),
    );
  }
}

class SunflowerWidget extends StatelessWidget {
  const SunflowerWidget(this.seeds, {super.key});

  static final math.Random random = math.Random();

  final int seeds;

  @override
  Widget build(BuildContext context) {
    final seedWidgets = <Widget>[];

    for (var i = 0; i < seeds; i++) {
      final (double x, double y) = insideSeedPosition(i);

      seedWidgets.add(
        const Seed(lit: true)
          .animatedAlign(
            key: ValueKey(i),
            duration: Duration(milliseconds: random.nextInt(500) + 250),
            curve: Curves.easeInOut,
            alignment: Alignment(x, y),
          ),
      );
    }

    for (var j = seeds; j < maxSeeds; j++) {
      final (double x, double y) = outsidePetalPosition(j);

      seedWidgets.add(
        const Seed(lit: false)
          .animatedAlign(
            key: ValueKey(j),
            duration: Duration(milliseconds: random.nextInt(500) + 250),
            curve: Curves.easeInOut,
            alignment: Alignment(x, y),
          ),
      );
    }

    return Stack(children: seedWidgets)
      .sizedBoxSquare(dimension: 600)
      .fittedBox(fit: BoxFit.contain);
  }
}

class Seed extends StatelessWidget {
  const Seed({super.key, required this.lit});

  final bool lit;

  @override
  Widget build(BuildContext context) {
    return const SizedBox.square(dimension: 5.0)
      .decoratedBox(
        decoration: BoxDecoration(
          color: lit ? Colors.orange : Colors.grey.shade700,
          borderRadius: BorderRadius.circular(3.0),
          shape: BoxShape.circle,
        ),
      );
  }
}
