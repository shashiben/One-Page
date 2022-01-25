import 'package:bootstrap/animations/animation_wrapper.dart';
import 'package:flutter/material.dart';

class ScaleAnimation extends StatelessWidget {
  final Duration? animationDuration;
  final Duration? startAfter;
  final AnimationController? controller;
  final bool startAnimation;
  final Widget child;
  final double? begin, end;
  const ScaleAnimation(
      {Key? key,
      this.animationDuration,
      this.startAfter,
      this.begin = 0,
      this.end = 1,
      required this.child,
      this.controller,
      this.startAnimation = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationWrapper(
      itemBuilder: ((context, controller) => ScaleTransition(
            scale: Tween(begin: begin, end: end).animate(controller),
            child: child,
          )),
      controller: controller,
      startAfter: startAfter,
      animationDuration: animationDuration,
      startAnimationAtStart: true,
    );
  }
}
