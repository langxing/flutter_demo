import 'package:flutter/material.dart';

/// 自定义动画组件
// ignore: must_be_immutable
class CurvedAnimationWidget extends AnimatedWidget {
  double size, width, height;
  VoidCallback _callback;
  Animation<double> _animation;
  CurvedAnimationWidget(this.size, this.width, this.height, this._callback, this._animation): super(listenable: _animation);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width + _animation.value.toInt(),
      height: height + _animation.value.toInt(),
      child: FloatingActionButton(
        child: Text(
            "Jack",
          style: TextStyle(
            fontSize: size + _animation.value.toInt()/2
          ),
        ),
          onPressed: _callback
      ),
    );
  }

}