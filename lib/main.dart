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
  var gridColors = new List<Color>.generate(500, (index) => Colors.grey);
  var targetPosition = 21;

  Timer _everySecond;

  @override
  Widget initState() {
    super.initState();

    gridColor = Colors.grey;
    // var gridColors = new List<Color>.generate(this.gridCount, (index) => Colors.grey);

    _everySecond = Timer.periodic(Duration(milliseconds: 500), (Timer t) {
      setState(() {
        _onTimerTick();
      });
    });
  }

  void _onTimerTick() {
    setState(() {
      if (targetPosition == 21) {
        gridColors[21] = Colors.grey;
        gridColors[22] = Colors.green;
        targetPosition = 22;
      } else {
        gridColors[22] = Colors.grey;
        gridColors[21] = Colors.green;
        targetPosition = 21;
      }
      // updatePosition();
    });
  }

  void updatePosition() {
    if (targetPosition == 21) {
      gridColors[21] = Colors.grey;
      gridColors[22] = Colors.green;
      targetPosition = 22;
    } else {
      gridColors[22] = Colors.grey;
      gridColors[21] = Colors.green;
      targetPosition = 21;
    }
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
                return Container(
                    height: 1, width: 1, color: this.gridColors[index]);
              }))
        ])));
  }
}
