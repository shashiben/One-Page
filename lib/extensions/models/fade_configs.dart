import 'package:flutter/material.dart';

class FadeConfigs {
  final Key? key;
  final Duration? animationDuration;
  final AnimationController? controller;
  final double begin;
  final double end;

  const FadeConfigs({
    this.key,
    this.animationDuration,
    this.controller,
    this.begin = 0,
    this.end = 1,
  });
}
