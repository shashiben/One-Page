import 'package:bootstrap/widgets/fadeAnimation.dart';
import 'package:bootstrap/widgets/scale_transition.dart';
import 'package:flutter/material.dart';

extension AnimationExtension on Widget {
  Widget fade({
    double seconds = 0.5,
    double? xDistance,
    double? yDistance,
    Duration? opacityDuration,
    Duration? xTranslateDuration,
    Duration? yTranslateDuration,
  }) {
    return FadeAnimation(
      delay: seconds,
      child: this,
      xDistance: xDistance,
      yDistance: yDistance,
      opacityDuration: opacityDuration,
      xTranslateDuration: xTranslateDuration,
      yTranslateDuration: yTranslateDuration,
    );
  }

  Widget scale({
    Duration? animationDuration,
    Duration? startAfter,
    AnimationController? controller,
    bool? startAnimation,
    double? begin,
    end,
  }) {
    return ScaleAnimation(
      child: this,
      animationDuration: animationDuration,
      startAfter: startAfter,
      controller: controller,
      begin: begin,
      end: end,
    );
  }
}
