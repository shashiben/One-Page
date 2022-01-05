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
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        
        setState(() {
          isHovered = false;
        });
      },
      child: widget.child(context, isHovered),
    );
  }
}
