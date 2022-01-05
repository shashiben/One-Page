import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  final Duration? animationDuration;
  final Duration? startAfter;
  final AnimationController? controller;
  final bool startAnimation;
  final Widget child;
  final double? begin, end;
  const ScaleAnimation(
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
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  @override
  void initState() {
    super.initState();
    _scaleController = widget.controller ??
        AnimationController(
            vsync: this,
            duration:
                widget.animationDuration ?? const Duration(milliseconds: 300));
    if (widget.startAnimation) {
      Future.delayed(widget.startAfter ?? const Duration(seconds: 0))
          .then((value) {
        _scaleController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _scaleController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween(begin: widget.begin ?? 0.0, end: widget.end ?? 1.0)
          .animate(_scaleController),
      child: widget.child,
    );
  }
}
