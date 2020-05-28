class Player {
  final String name;
  int life;

  Player({this.name, this.life = 20});

  void changeLifeCounter(int number) {
    life += number;
  }

  void reset() {
    life = 20;
  }
}
