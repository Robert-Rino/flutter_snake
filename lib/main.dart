import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Home(),
      appBar: AppBar(title: Text('Home')),
    ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Game()));
      },
      child: Text('Go to Game'),
    ));
  }
}

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
class Game extends StatelessWidget {
  static const String _title = 'Game Route';

  @override
  Widget build(BuildContext context) {
    int gridCount = 500;

    Widget GameWidget() {
      // return GridView.count(
      //     padding: const EdgeInsets.all(5.0),
      //     crossAxisCount: 20,
      //     mainAxisSpacing: 2.0,
      //     crossAxisSpacing: 2.0,
      //     childAspectRatio: 1.0,
      //     children: List.generate(gridCount, (index) {
      //       return Container(height: 1, width: 1, color: Colors.grey);
      //     }));

      return Container(
          child: Column(children: [
        GridView.count(
            padding: const EdgeInsets.all(5.0),
            crossAxisCount: 20,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 1.0,
            children: List.generate(gridCount, (index) {
              return Container(height: 1, width: 1, color: Colors.grey);
            }))
      ]));
    }

    return MaterialApp(
      title: _title,
      home: Scaffold(
          appBar: AppBar(title: const Text(_title)),
          // body: GridView.count(
          //     padding: const EdgeInsets.all(5.0),
          //     crossAxisCount: 20,
          //     mainAxisSpacing: 2.0,
          //     crossAxisSpacing: 2.0,
          //     childAspectRatio: 1.0,
          //     children: List.generate(gridCount, (index) {
          //       return Container(height: 1, width: 1, color: Colors.grey);
          //     }))
          body: Row(
            children: [
              // GridView.count(
              //     padding: const EdgeInsets.all(5.0),
              //     crossAxisCount: 20,
              //     mainAxisSpacing: 2.0,
              //     crossAxisSpacing: 2.0,
              //     childAspectRatio: 1.0,
              //     semanticChildCount: gridCount,
              //     children: List.generate(gridCount, (int index) {
              //       return Container(height: 1, width: 1, color: Colors.grey);
              //     })),
              Text('asasdfdsf'),
              Text('asasdfdsfsdfsdfsdfsdf'),
            ],
          )
          // body: GameWidget(),
          ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
// class MyStatefulWidget extends StatefulWidget {
//   MyStatefulWidget({Key key}) : super(key: key);

//   @override
//   _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
// }

// /// This is the private State class that goes with MyStatefulWidget.
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   double position = 1;
//   double _left = 1;
//   bool _isFavorited = true;
//   int _favoriteCount = 41;

//   Widget first_row() {
//     List<int> text = [1, 2, 3, 4, 5];
//     return Column(children: [for (var i in text) Text(i.toString())]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         first_row(),
//         Container(
//           padding: EdgeInsets.all(0),
//           child: IconButton(
//             icon: (_isFavorited ? Icon(Icons.star) : Icon(Icons.star_border)),
//             color: Colors.red[500],
//             onPressed: _toggleFavorite,
//           ),
//         ),
//         Container(
//           width: 18,
//           child: Text('$_favoriteCount'),
//         ),
//       ],
//     );
//   }

//   void _toggleFavorite() {
//     var period = const Duration(seconds: 1);
//     Timer.periodic(period, (timer) {
//       if (_isFavorited) {
//         _favoriteCount -= 1;
//         _isFavorited = false;
//       } else {
//         _favoriteCount += 1;
//         _isFavorited = true;
//       }
//       setState(() {});
//     });
//   }
// }
