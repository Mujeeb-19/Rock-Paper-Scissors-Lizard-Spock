import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showDialog() {
      // flutter defined function
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Alert Dialog title"),
            content: Image.asset('images/game.jpg'),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.info,
                color: Colors.blueAccent,
                size: 34,
              ),
              onPressed: () {
                _showDialog();
              })
        ],
        backgroundColor: Colors.blue.shade900,
        title: Text(
          'Rock Paper Scissors Lizard Spock!',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 13),
        ),
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 6;
  int ballNumbers = 6;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/sheldon.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /////
            Expanded(
              child: Row(children: <Widget>[
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.all(10),
                    onPressed: () {
                      setState(() {
                        ballNumber = Random().nextInt(5) + 1; /////
                      });
                    },
                    child: Image.asset(
                      'images/ball$ballNumber.jpg', /////
                    ),
                  ),
                ),
                Text(
                  'TEAM A', /////
                  style: TextStyle(backgroundColor: Colors.pink),
                )
              ]),
            ),
            /////
            Divider(
              color: Colors.pink,
            ),
            Expanded(
              child: Row(children: <Widget>[
                Expanded(
                  child: FlatButton(
                    padding: EdgeInsets.all(10),
                    onPressed: () {
                      setState(() {
                        ballNumbers = Random().nextInt(5) + 1;
                      });
                    },
                    child: Image.asset(
                      'images/ball$ballNumbers.jpg',
                    ),
                  ),
                ),
                Text(
                  'TEAM B',
                  style: TextStyle(backgroundColor: Colors.pink),
                )
              ]),
            ),
            FlatButton(
              color: Colors.redAccent,
              onPressed: () {
                setState(() {
                  ballNumber = 6;
                  ballNumbers = 6;
                });
              },
              child: Text('RESTART'),
            )
          ],
        ),
      ),
    );
  }
}
