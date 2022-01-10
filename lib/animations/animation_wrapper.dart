import 'package:flutter/material.dart';

class AnimationWrapper extends StatefulWidget {
  final Duration? animationDuration;
  final Duration? startAfter;
  final AnimationController? controller;
  final bool startAnimation;
  final Widget Function(BuildContext context, AnimationController controller)
      itemBuilder;

  const AnimationWrapper(
      {Key? key,
      this.animationDuration,
      this.startAfter,
      this.controller,
      this.startAnimation = true,
      required this.itemBuilder})
      : super(key: key);

  @override
  State<AnimationWrapper> createState() => _AnimationWrapperState();
}

class _AnimationWrapperState extends State<AnimationWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = widget.controller ??
        AnimationController(
            vsync: this,
            duration:
                widget.animationDuration ?? const Duration(milliseconds: 300));
    if (widget.startAnimation) {
      Future<void>.delayed(widget.startAfter ?? const Duration())
          .then((dynamic value) {
        _animationController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.itemBuilder(context, _animationController);
  }
}
