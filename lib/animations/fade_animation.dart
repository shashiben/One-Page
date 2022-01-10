import 'package:bootstrap/animations/animation_wrapper.dart';
import 'package:flutter/material.dart';

class FadeAnimation extends StatelessWidget {
  final Duration? animationDuration;
  final Duration? startAfter;
  final AnimationController? controller;
  final bool startAnimation;
  final Widget child;
  final double? begin, end;
  const FadeAnimation(
      {Key? key,
      this.animationDuration,
      this.startAfter,
      this.begin,
      this.end,
      required this.child,
      this.controller,
      this.startAnimation = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationWrapper(
      itemBuilder: ((context, controller) => FadeTransition(
            opacity: controller.view,
            child: child,
          )),
      controller: controller,
      startAfter: startAfter,
      animationDuration: animationDuration,
      startAnimation: true,
    );
  }
}
