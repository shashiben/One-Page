import 'package:bootstrap/animations/animation_wrapper.dart';
import 'package:flutter/material.dart';

class TranslateAnimation extends StatelessWidget {
  final Duration? animationDuration;
  final Duration? startAfter;
  final AnimationController? controller;
  final bool startAnimation;
  final Widget child;
  final Offset begin, end;
  const TranslateAnimation(
      {Key? key,
      this.animationDuration,
      this.startAfter,
      required this.begin,
      required this.end,
      required this.child,
      this.controller,
      this.startAnimation = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationWrapper(
      itemBuilder: ((context, controller) {
        Animation<double> _xAxis =
            Tween(begin: begin.dx, end: end.dx).animate(controller);
        Animation<double> _yAxis =
            Tween(begin: begin.dy, end: end.dy).animate(controller);

        return AnimatedBuilder(
          child: child,
          animation: controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_xAxis.value, _yAxis.value),
              child: child,
            );
          },
        );
      }),
      controller: controller,
      startAfter: startAfter,
      animationDuration: animationDuration,
      startAnimation: true,
    );
  }
}
