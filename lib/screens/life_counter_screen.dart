import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    final counters = <Counter>[];

    for (var i = 0; i < _playerNames.length; i++) {
      counters.add(Counter(
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
// ##### Finish:CounterRoute.dart#####
// #########################################################################

// #########################################################################
// ##### Start:Counter.dart#####
//import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  Counter({Key key, this.name}) : super(key: key);
  final String name;

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  // 画面を横に固定する場合
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  int _counter = 20;

  void _changeCounter(int number) {
    setState(() {
      _counter += number;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 20;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _resetCounter,
              tooltip: 'Reset',
              child: Icon(Icons.update),
            ),
            Text(
              widget.name,
            ),
            FlatButton(
              shape: CircleBorder(),
              child: Text(
                '$_counter',
                style: TextStyle(fontSize: 70),
              ),
              onPressed: () => _changeCounter(-1),
              highlightColor: Colors.pink,
              splashColor: Colors.red,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              IconButton(
                icon: Icon(Icons.exposure_neg_1),
                tooltip: 'Decrease count by 1',
                onPressed: () => _changeCounter(-1),
                highlightColor: Colors.pink,
                splashColor: Colors.red,
              ),
              const SizedBox(width: 20.0),
              IconButton(
                icon: Icon(Icons.exposure_plus_1),
                tooltip: 'Increase count by 1',
                onPressed: () => _changeCounter(1),
                highlightColor: Colors.pink,
                splashColor: Colors.blue,
              ),
            ]),
            const SizedBox(height: 20.0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              IconButton(
                icon: Icon(Icons.exposure_neg_2),
                tooltip: 'Decrease count by 2',
                onPressed: () => _changeCounter(-2),
                highlightColor: Colors.pink,
                splashColor: Colors.orange,
              ),
              const SizedBox(width: 20.0),
              IconButton(
                icon: Icon(Icons.exposure_plus_2),
                tooltip: 'Increase count by 2',
                onPressed: () => _changeCounter(2),
                highlightColor: Colors.pink,
                splashColor: Colors.indigo,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}