import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtglifecounter/models/player_data.dart';
import 'package:mtglifecounter/modules/life_counter.dart';

PlayerData playerData = PlayerData();

class LifeCounterScreen extends StatelessWidget {
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
    // 画面を横に固定する場合
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);

    final counters = <LifeCounter>[];

    for (var i = 0; i < playerData.playerCount; i++) {
      counters.add(LifeCounter(
        player: playerData.players[i],
      ));
    }

    final gridView = Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: _buildCategoryWidgets(counters),
    );

    return Scaffold(
      body: SafeArea(child: gridView),
    );
  }
}
