import 'package:flutter/material.dart';

class TranslateConfigs {
  final Key? key;
  final Duration? animationDuration;
  final AnimationController? controller;
  final Offset begin;
  final Offset end;

  const TranslateConfigs({
    this.key,
    this.animationDuration,
    this.controller,
    this.begin = const Offset(0, 30),
    this.end = const Offset(0, 0),
  });
}
