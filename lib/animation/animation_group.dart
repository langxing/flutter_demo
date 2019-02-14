import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimationState();
  }
}

class AnimationState extends State<AnimationPage>
    with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: AnimationWidget(_animation, 50, 50, () {
        _controller.forward(from: 0.0);
      }),
    );
  }
}

// ignore: must_be_immutable
class AnimationWidget extends StatelessWidget {
  static final _opacityTween = new Tween<double>(begin: 0.5, end: 1.0);
  static final _sizeTween = new Tween<double>(begin: 0.0, end: 100.0);
  Animation<double> _animation;
  double _width, _height;
  VoidCallback _callback;

  AnimationWidget(this._animation, this._width, this._height, this._callback);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget widget) {
            return Center(
              child: SizedBox(
                  width: _width + _sizeTween.evaluate(_animation),
                  height: _height + _sizeTween.evaluate(_animation),
                  child: Opacity(
                    opacity: _opacityTween.evaluate(_animation),
                    child: FloatingActionButton(
                      onPressed: _callback,
                      child: Text(
                        "Jack",
                        style: TextStyle(
                            fontSize: 10 + _sizeTween.evaluate(_animation) / 2),
                      ),
                    ),
                  )),
            );
          }),
    );
  }
}
