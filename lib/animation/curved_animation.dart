import 'package:flutter/material.dart';
import 'curved_animation_widget.dart';

class CurvedAnimationPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return CurvedAnimationState();
  }

}

class CurvedAnimationState extends State<CurvedAnimationPage> with TickerProviderStateMixin {
  double size = 10;
  double width = 50;
  double height = 50;
  /// 动画控制器
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    var curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack);
    _animation = Tween(begin: 0.0, end: 100.0).animate(curvedAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CurvedAnimationWidget(size, width, height, () {
          startAnimation();
        }, _animation),
      ),
    );
  }

  void startAnimation() {
    setState(() {
      size = 10;
      width = 50;
      height = 50;
    });
    _controller?.reset();
    _controller?.forward(from: 0.0);
  }

}