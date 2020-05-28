import 'package:mtglifecounter/models/player.dart';

class PlayerData {
  List<Player> players = [
    Player(name: 'Player1'),
    Player(name: 'Player2'),
  ];

  int get playerCount {
    return players.length;
  }
}
