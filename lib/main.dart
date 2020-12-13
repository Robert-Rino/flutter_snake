import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  // runApp(MyApp());
  runApp(Game());
}

// ** Home
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       body: Home(),
//       appBar: AppBar(title: Text('Home')),
//     ));
//   }
// }

// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: ElevatedButton(
//       onPressed: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => Game()));
//       },
//       child: Text('Go to Game'),
//     ));
//   }
// }

class GameRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('GameRoute')),
        body: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Container(color: Colors.pink, width: 100, height: 100)));
  }
}

/// This is Snake Game application widget.
// class Game extends StatelessWidget {
class Game extends StatefulWidget {
  // static const _title = 'Game Route';
  // const Game({Key key}) : super(key: key);
  final gridCount = 500;
  var gridColor = Colors.grey;

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  final gridCount = 500;
  var gridColor = Colors.grey;
  Timer _everySecond;

  @override
  Widget initState() {
    super.initState();

    gridColor = gridColor == Colors.grey ? Colors.green : Colors.grey;
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _onTimerTick();
      });
    });
  }

  void _onTimerTick() {
    setState(() {
      gridColor = gridColor == Colors.grey ? Colors.green : Colors.grey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          GridView.count(
              shrinkWrap: true,
              padding: const EdgeInsets.all(5.0),
              crossAxisCount: 20,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 1.0,
              children: List.generate(gridCount, (index) {
                return Container(height: 1, width: 1, color: gridColor);
              }))
        ])));
  }
}
