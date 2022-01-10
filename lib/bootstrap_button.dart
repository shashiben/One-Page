import 'package:flutter/material.dart';

import 'extensions/extensions.dart';
import 'widgets/hover_widget.dart';

enum ButtonVariant { filled, outlined }

class BootstrapButton extends StatelessWidget {
  final Widget Function(bool isHovered) child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final void Function()? onPressed;
  final Color? color;
  final Color? outlineColor;

  final ButtonVariant variant;
  final BorderRadiusGeometry? borderRadius;
  const BootstrapButton(
      {Key? key,
      required this.child,
      this.onPressed,
      this.color,
      this.outlineColor,
      this.padding,
      this.margin,
      this.variant = ButtonVariant.filled,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: HoverWidget(
            builder: (BuildContext context, bool isHovered) => variant ==
                    ButtonVariant.filled
                ? Container(
                    margin: margin,
                    padding: padding,
                    decoration: BoxDecoration(
                        color: color ?? context.primaryColor,
                        borderRadius: borderRadius ?? BorderRadius.circular(5)),
                    child: child(isHovered),
                  )
                : AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: margin,
                    padding: padding,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: color ?? context.primaryColor, width: 1.5),
                        color: isHovered
                            ? (color ?? context.primaryColor)
                            : outlineColor,
                        borderRadius: borderRadius ?? BorderRadius.circular(5)),
                    child: child(isHovered),
                  )));
  }
}
