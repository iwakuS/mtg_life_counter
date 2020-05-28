import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mtglifecounter/models/player.dart';

class LifeCounter extends StatefulWidget {
  final Player player;

  LifeCounter({this.player});

  @override
  _LifeCounterState createState() => _LifeCounterState();
}

class _LifeCounterState extends State<LifeCounter> {
  // 画面を横に固定する場合
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              setState(() {
                widget.player.reset();
              });
            },
            tooltip: 'Reset',
            child: Icon(Icons.update),
          ),
          Text(
            widget.player.name,
          ),
          FlatButton(
            shape: CircleBorder(),
            child: Text(
              '${widget.player.life}',
              style: TextStyle(fontSize: 70),
            ),
            onPressed: () {
              setState(() {
                widget.player.changeLifeCounter(-1);
              });
            },
            highlightColor: Colors.pink,
            splashColor: Colors.red,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            IconButton(
              icon: Icon(Icons.exposure_neg_1),
              tooltip: 'Decrease count by 1',
              onPressed: () {
                setState(() {
                  widget.player.changeLifeCounter(-1);
                });
              },
              highlightColor: Colors.pink,
              splashColor: Colors.red,
            ),
            const SizedBox(width: 20.0),
            IconButton(
              icon: Icon(Icons.exposure_plus_1),
              tooltip: 'Increase count by 1',
              onPressed: () {
                setState(() {
                  widget.player.changeLifeCounter(1);
                });
              },
              highlightColor: Colors.pink,
              splashColor: Colors.blue,
            ),
          ]),
          const SizedBox(height: 20.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            IconButton(
              icon: Icon(Icons.exposure_neg_2),
              tooltip: 'Decrease count by 2',
              onPressed: () {
                setState(() {
                  widget.player.changeLifeCounter(-2);
                });
              },
              highlightColor: Colors.pink,
              splashColor: Colors.orange,
            ),
            const SizedBox(width: 20.0),
            IconButton(
              icon: Icon(Icons.exposure_plus_2),
              tooltip: 'Increase count by 2',
              onPressed: () {
                setState(() {
                  widget.player.changeLifeCounter(2);
                });
              },
              highlightColor: Colors.pink,
              splashColor: Colors.indigo,
            ),
          ]),
        ],
      ),
    );
  }
}
