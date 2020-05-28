// メモ
// playerクラスに関数をいろいろ持たせてよいかは、疑問
// 特に、内部関数等にしていないので、セキュリティはあやしい
// ##############################################################

import 'package:flutter/material.dart';
import 'package:mtglifecounter/screens/life_counter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LifeCounterScreen(),
    );
  }
}
