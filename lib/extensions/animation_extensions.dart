import 'package:bootstrap/animations/fade_and_translate.dart';
import 'package:bootstrap/animations/fade_animation.dart';
import 'package:bootstrap/animations/translate_animation.dart';
import 'package:bootstrap/extensions/models/fade_configs.dart';
import 'package:bootstrap/extensions/models/translate_configs.dart';
import 'package:flutter/material.dart';

import '../animations/scale_animation.dart';

extension AnimationExtension on Widget {
  Widget fade({
    Key? key,
    Duration? animationDuration,
    Duration? startAfter,
    AnimationController? controller,
    bool startAnimation = false,
    double? begin,
    double? end,
  }) {
    return FadeAnimation(
      key: key,
      child: this,
      animationDuration: animationDuration,
      startAnimation: startAnimation,
      startAfter: startAfter,
      controller: controller,
      begin: begin,
      end: end,
    );
  }

  Widget scale({
    Key? key,
    Duration? animationDuration,
    Duration? startAfter,
    AnimationController? controller,
    bool? startAnimation,
    double? begin,
    double? end,
  }) {
    return ScaleAnimation(
      key: key,
      animationDuration: animationDuration,
      startAfter: startAfter,
      controller: controller,
      begin: begin,
      end: end,
      child: this,
    );
  }

  Widget translate({
    Key? key,
    Duration? animationDuration,
    Duration? startAfter,
    AnimationController? controller,
    bool? startAnimation,
    Offset begin = const Offset(0, 30),
    Offset end = const Offset(0, 0),
  }) {
    return TranslateAnimation(
      key: key,
      animationDuration: animationDuration,
      startAfter: startAfter,
      controller: controller,
      begin: begin,
      end: end,
      child: this,
    );
  }

  Widget fadeAndTranslate(
      {FadeConfigs fadeConfigs = const FadeConfigs(),
      Duration startAfter = const Duration(seconds: 0),
      Duration animationDuration = const Duration(milliseconds: 500),
      bool? startAnimation,
       void Function()? onCompleted,
      onDismissed,
      TranslateConfigs translateConfigs = const TranslateConfigs()}) {
    return FadeAndTranslate(
        key: key,
        animationDuration: animationDuration,
        startAfter: startAfter,
        startAnimation: startAnimation,
        fadeConfigs: fadeConfigs,
        translateConfigs: translateConfigs,
        child: this);
  }
}
