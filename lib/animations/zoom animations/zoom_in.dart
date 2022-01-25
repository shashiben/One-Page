import 'package:bootstrap/animations/animation_wrapper.dart';
import 'package:bootstrap/animations/scale_animation.dart';
import 'package:flutter/material.dart';

class ZoomInAnimation extends StatelessWidget {
  final Widget child;
  final AnimationController? controller;
  const ZoomInAnimation({Key? key, required this.child, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationWrapper(
        controller: controller,
        itemBuilder: (context, controller) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(controller),
            child: AnimatedBuilder(
              animation: controller,
              child: child,
              builder: (BuildContext context, Widget? child) => ScaleAnimation(
                child: this.child,
                begin: 1 - 0.7 * 1,
              ),
            ),
          );
        });
  }
}
