import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimationWrapper extends StatefulWidget {
  final Duration? animationDuration;
  final Duration? startAfter;
  final AnimationController? controller;
  final bool startAnimationAtStart;
  final Widget Function(BuildContext context, AnimationController controller)
      itemBuilder;
  final double visibleAt;
  final Key? childKey;
  final void Function()? onCompleted, onDismissed;

  const AnimationWrapper(
      {Key? key,
      this.animationDuration,
      this.startAfter,
      this.controller,
      this.startAnimationAtStart = false,
      required this.itemBuilder,
      this.onCompleted,
      this.onDismissed,
      this.visibleAt = 1,
      this.childKey})
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
    widgetKey = widget.childKey ?? GlobalKey();
    _animationController = widget.controller ??
        AnimationController(
            vsync: this,
            duration:
                widget.animationDuration ?? const Duration(milliseconds: 800));
    if (widget.startAnimationAtStart) {
      Future<void>.delayed(widget.startAfter ?? const Duration())
          .then((dynamic value) {
        _animationController.forward().then((value) {
          setState(() {
            isAnimationDone = true;
          });
        });
      });
    }
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        if (widget.onCompleted != null) widget.onCompleted!();
      }
      if (_animationController.isDismissed) {
        if (widget.onDismissed != null) widget.onDismissed!();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  bool isAnimationDone = false;
  late Key widgetKey;
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: widgetKey,
        onVisibilityChanged: (info) {
          if (info.visibleFraction >= widget.visibleAt) {
            if (!isAnimationDone) {
              setState(() {
                isAnimationDone = true;
              });
              _animationController.forward();
            }
          }
        },
        child: widget.itemBuilder(context, _animationController));
  }
}
