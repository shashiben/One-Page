import 'package:bootstrap/app/colors.dart';
import 'package:flutter/material.dart';
import 'package:bootstrap/extensions.dart';

class NavigationDrawer extends StatefulWidget {
  final Color? color;
  final BoxDecoration? decoration;
  final Widget leading;
  final EdgeInsets? padding;
  final ScrollController? scrollController;
  final Widget? menuIcon;
  final List<Widget> childrens;
  final double minWidth;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  const NavigationDrawer(
      {Key? key,
      this.color,
      this.scrollController,
      this.mainAxisAlignment = MainAxisAlignment.end,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.decoration,
      required this.childrens,
      this.menuIcon,
      this.minWidth = 992,
      this.leading = const SizedBox(),
      this.padding})
      : assert(
          color == null || decoration == null,
          'Cannot provide both a color and a decoration\n'
          'To provide both, use "decoration: BoxDecoration(color: color)".',
        ),
        super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: context.width,
      child: Row(children: [
        widget.leading,
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: context.width > widget.minWidth
              ? widget.childrens
              : [
                  const Spacer(),
                  const Icon(
                    Icons.menu,
                    color: textPrimaryColor,
                  ).onTap(() {}),
                ],
        )),
      ]),
      decoration: widget.decoration ??
          BoxDecoration(
            boxShadow: (widget.scrollController == null ||
                    (widget.scrollController?.offset ?? 0) < 250)
                ? null
                : [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.8),
                      spreadRadius: 20,
                      blurRadius: 5,
                      offset: const Offset(10, 7),
                    ),
                  ],
            color: widget.color ?? context.themeData.scaffoldBackgroundColor,
            border: Border(
              bottom: BorderSide(
                  width: (widget.scrollController == null ||
                          (widget.scrollController?.offset ?? 0) < 250)
                      ? 0.8
                      : 1,
                  color: Colors.grey[300]!),
            ),
          ),
    );
  }
}