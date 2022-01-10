import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HoverWidget extends StatefulWidget {
  final Duration hoverDuration;
  final Widget Function(BuildContext context, bool isHovered) builder;
  const HoverWidget(
      {Key? key,
      required this.builder,
      this.hoverDuration = const Duration(seconds: 1)})
      : super(key: key);

  @override
  State<HoverWidget> createState() => _HoverWidgetState();
}

class _HoverWidgetState extends State<HoverWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerHover: (p) {
        if (!isHovered) {
          setState(() {
            isHovered = true;
          });
        }
      },
      onPointerUp: (p) {
        Future.delayed(widget.hoverDuration).then((value) {
          if (isHovered && mounted) {
            setState(() {
              isHovered = false;
            });
          }
        });
      },
      child: MouseRegion(
        onEnter: (event) {
          if (!isHovered) {
            setState(() {
              isHovered = true;
            });
          }
        },
        onExit: (PointerExitEvent event) {
          if (isHovered) {
            setState(() {
              isHovered = false;
            });
          }
        },
        onHover: (p) {
          if (!isHovered) {
            setState(() {
              isHovered = true;
            });
          }
        },
        child: widget.builder(context, isHovered),
      ),
    );
  }
}
