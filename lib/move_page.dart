import 'package:flutter/material.dart';

class MovePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MoveState();
  }
}

class MoveState extends State<MovePage> {
  double _left = 20.0;
  double _top = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: _left,
            top: _top,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("JACK"),
              ),
              onPanDown: (details) {
                print("手指按下");
              },
              onPanUpdate: (DragUpdateDetails e) {
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                print("手指离开屏幕");
                print(e.velocity);
              },
            )
          )
        ],
      ),
    );
  }
}
