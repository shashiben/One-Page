import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnimationType { opacity, translateX, translateY }

class FadeAnimation extends StatelessWidget {
  final double? delay;
  final Widget child;
  final double? xDistance;
  final double? yDistance;
  final Duration? opacityDuration;
  final Duration? xTranslateDuration;
  final Duration? yTranslateDuration;
  const FadeAnimation(
      {Key? key,
      this.delay,
      required this.child,
      this.xDistance,
      this.yDistance,
      this.opacityDuration,
      this.xTranslateDuration,
      this.yTranslateDuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MultiTween<AnimationType> tween = MultiTween<AnimationType>()
      ..add(AnimationType.opacity, Tween(begin: 0.0, end: 1.0),
          opacityDuration ?? const Duration(milliseconds: 500))
      ..add(
        AnimationType.translateX,
        Tween(begin: xDistance ?? 0.0, end: 1.0),
        xTranslateDuration ?? const Duration(milliseconds: 500),
      )
      ..add(
        AnimationType.translateY,
        Tween(begin: yDistance ?? 30.0, end: 1.0),
        yTranslateDuration ?? const Duration(milliseconds: 500),
      );

    return PlayAnimation<MultiTweenValues<AnimationType>>(
      delay: Duration(milliseconds: (1000 * (delay ?? 0.5)).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (BuildContext context, Widget? child, MultiTweenValues<AnimationType> value) => Opacity(
        opacity: value.get(AnimationType.opacity),
        child: Transform.translate(
            offset: Offset(value.get(AnimationType.translateX),
                value.get(AnimationType.translateY)),
            child: child),
      ),
    );
  }
}
