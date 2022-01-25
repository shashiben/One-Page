import 'package:bootstrap/animations/fade_animation.dart';
import 'package:bootstrap/animations/translate_animation.dart';
import 'package:bootstrap/extensions/models/fade_configs.dart';
import 'package:bootstrap/extensions/models/translate_configs.dart';
import 'package:flutter/material.dart';

class FadeAndTranslate extends StatelessWidget {
  final FadeConfigs fadeConfigs;
  final TranslateConfigs translateConfigs;
  final Widget child;
  final bool? startAnimation;
  final Duration? startAfter;
  final Duration? animationDuration;
  final void Function()? onCompleted, onDismissed;

  const FadeAndTranslate(
      {Key? key,
      this.startAfter,
      this.animationDuration,
      this.startAnimation = true,
      required this.fadeConfigs,
      required this.translateConfigs,
      required this.child,
      this.onCompleted,
      this.onDismissed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      begin: fadeConfigs.begin,
      controller: fadeConfigs.controller,
      startAfter: startAfter,
      startAnimation: startAnimation,
      end: fadeConfigs.end,
      animationDuration: fadeConfigs.animationDuration ?? animationDuration,
      key: fadeConfigs.key,
      child: TranslateAnimation(
        animationDuration:
            translateConfigs.animationDuration ?? animationDuration,
        begin: translateConfigs.begin,
        controller: translateConfigs.controller,
        startAfter: startAfter,
        startAnimation: startAnimation,
        end: translateConfigs.end,
        key: translateConfigs.key,
        child: child,
      ),
    );
  }
}
