import 'package:flutter/material.dart';
import 'package:batterylevel/move_page.dart';
import 'package:batterylevel/counter_page.dart';
import 'package:batterylevel/transfer_page.dart';
import 'package:batterylevel/animation/animation_group.dart';
import 'package:batterylevel/animation/tween_animation.dart';
import 'package:batterylevel/animation/curved_animation.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }

}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainState();
  }

}

class MainState extends State<MainPage> {
  List<String> texts = ["flutter调用Android原生", "flutter使用redux", "flutter手势操作", "flutter入门补间动画", "flutter使用非线性动画", "flutter使用动画组"];
  List<Color> colors = [Colors.redAccent, Colors.deepPurpleAccent, Colors.amber, Colors.cyanAccent, Colors.deepOrange, Colors.black26];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Center(
            child: Text(
              "flutter实例",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15
              ),
            )
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            createWidget(0),
            createWidget(1),
            createWidget(2),
            createWidget(3),
            createWidget(4),
            createWidget(5),
          ],
        )
      ),
    );
  }
  
  Widget createWidget(int index) {
    return Container(
      width: 200,
      height: 50,
      color: colors[index],
      child: GestureDetector(
        child: Center(
          child: Text(
            texts[index],
            style: TextStyle(
                color: Colors.white,
                fontSize: 15
            ),
          )
        ),
        onTap: () {
          if(index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CounterApp()));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MovePage()));
          } else if (index == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => TweenPage()));
          } else if (index == 4) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CurvedAnimationPage()));
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AnimationPage()));
          }
        },
      ),
    );
  }

}