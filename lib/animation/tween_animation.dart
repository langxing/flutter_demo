import 'package:flutter/material.dart';

class TweenPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TweenState();
  }

}

class _TweenState extends State<TweenPage> with SingleTickerProviderStateMixin {
  int text = 0;
  double size = 10;
  double width = 50;
  double height = 50;
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
    animation = Tween(begin: 0.0, end: 100.0).animate(animationController)
      ..addListener(() {
        setState(() {
          text = animation.value.toInt();
          width += animation.value.toInt()/50;
          height += animation.value.toInt()/50;
          size += animation.value.toInt()/100;
          print("$text");
        });
      })
      ..addStatusListener((status) {
        if(status == AnimationStatus.forward) {
          print("动画开始执行");
        } else if (status == AnimationStatus.completed) {
          print("动画执行结束");
        } else if (status == AnimationStatus.dismissed) {
          print("动画消失");
        } else if (status == AnimationStatus.reverse) {
          print("动画重置");
        }
      });
  }

  void _animationStart() {
    setState(() {
      text = 0;
      size = 10;
      width = 50;
      height = 50;
    });
    animationController.reset();
    animationController?.forward(from: 0.0);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: width,
            height: height,
            child: FloatingActionButton(
                child: Text(
                  "$text",
                  style: TextStyle(
                      fontSize: size
                  ),
                ),
                onPressed: _animationStart
            )

        )
      ),
    );
  }

}