import 'package:flutter/material.dart';
import 'package:mtglifecounter/module/life_counter.dart';

class LifeCounterScreen extends StatelessWidget {
  const LifeCounterScreen();
  static const _playerNames = <String>[
    'Player1',
    'Player2',
  ];

  Widget _buildCategoryWidgets(List<Widget> counters) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) => counters[index],
      itemCount: counters.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final counters = <LifeCounter>[];

    for (var i = 0; i < _playerNames.length; i++) {
      counters.add(LifeCounter(
        name: _playerNames[i],
      ));
    }

    final gridView = Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoryWidgets(counters),
    );

    return Scaffold(
      body: gridView,
    );
  }
}
