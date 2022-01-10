import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HoverWidget extends StatefulWidget {
  final Widget Function(BuildContext context, bool isHovered) child;
  const HoverWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<HoverWidget> createState() => _HoverWidgetState();
}

class _HoverWidgetState extends State<HoverWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerHover: (p) {
        setState(() {
          isHovered = true;
        });
      },
      onPointerUp: (p) {
        setState(() {
          isHovered = false;
        });
      },
      child: MouseRegion(
        onExit: (PointerExitEvent event) {
          if (isHovered) {
            setState(() {
              isHovered = false;
            });
          }
        },
        child: widget.child(context, isHovered),
      ),
    );
  }
}
