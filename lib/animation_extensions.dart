import 'package:flutter/material.dart';

import 'widgets/fadeAnimation.dart';
import 'widgets/scale_transition.dart';

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
      xDistance: xDistance,
      yDistance: yDistance,
      opacityDuration: opacityDuration,
      xTranslateDuration: xTranslateDuration,
      yTranslateDuration: yTranslateDuration,
      child: this,
    );
  }

  Widget scale({
    Duration? animationDuration,
    Duration? startAfter,
    AnimationController? controller,
    bool? startAnimation,
    double? begin,
   double? end,
  }) {
    return ScaleAnimation(
      animationDuration: animationDuration,
      startAfter: startAfter,
      controller: controller,
      begin: begin,
      end: end,
      child: this,
    );
  }
}
