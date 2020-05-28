import 'package:flutter/material.dart';
import 'package:mtglifecounter/models/player.dart';
import 'package:mtglifecounter/utilities/constants.dart';

class LifeCounter extends StatefulWidget {
  final Player player;

  LifeCounter({this.player});

  @override
  _LifeCounterState createState() => _LifeCounterState();
}

class _LifeCounterState extends State<LifeCounter> {
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
              style: kLifeTextStyle,
            ),
            onPressed: () {
              setState(() {
                widget.player.changeLifeCounter(-1);
              });
            },
            splashColor: kDecrement1Color,
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
              splashColor: kDecrement1Color,
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
              splashColor: kIncrement1Color,
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
              splashColor: kDecrement2Color,
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
              splashColor: kIncrement2Color,
            ),
          ]),
        ],
      ),
    );
  }
}
