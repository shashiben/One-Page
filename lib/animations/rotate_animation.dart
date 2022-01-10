import 'package:flutter/material.dart';

class RotateAnimation extends StatefulWidget {
  final Duration? animationDuration;
  final Duration? startAfter;
  final AnimationController? controller;
  final bool startAnimation;
  final Widget child;
  final double? begin, end;
  const RotateAnimation(
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
  _RotateAnimationState createState() => _RotateAnimationState();
}

class _RotateAnimationState extends State<RotateAnimation>
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
      Future<void>.delayed(widget.startAfter ?? const Duration())
          .then((dynamic value) {
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
