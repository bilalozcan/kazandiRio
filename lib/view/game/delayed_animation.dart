import 'dart:async';

import 'package:flutter/material.dart';

class DelayedAnimation extends StatefulWidget {
  final Widget child;
  final Curve curve;
  final int delayedAnimation;
  static bool disableButton = true;

  const DelayedAnimation({Key? key, required this.delayedAnimation, required this.child, required this.curve})
      : super(key: key);
  @override
  _DelayedAnimationState createState() => _DelayedAnimationState();
}

class _DelayedAnimationState extends State<DelayedAnimation> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _animationOffset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));

    final curve = CurvedAnimation(curve: widget.curve, parent: _controller!);

    _animationOffset = Tween<Offset>(begin: Offset(0.0, 0.35), end: Offset.zero).animate(curve);

    Timer(Duration(milliseconds: widget.delayedAnimation), () {
      _controller!.forward();
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: SlideTransition(
        position: _animationOffset!,
        child: widget.child,
      ),
      opacity: _controller!,
    );
  }
}