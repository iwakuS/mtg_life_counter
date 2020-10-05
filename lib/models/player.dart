import 'package:mtglifecounter/utilities/constants.dart';

class Player {
  final String name;
  int life;

  Player({this.name, this.life = kDefaultLife});

  void changeLifeCounter(int number) {
    life += number;
  }

  void reset() {
    life = kDefaultLife;
  }
}
