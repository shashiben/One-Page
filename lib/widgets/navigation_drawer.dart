import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';

import '../app/colors.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer(
      {super.key,
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
        );
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

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: context.width,
      decoration: widget.decoration ??
          BoxDecoration(
            boxShadow: (widget.scrollController == null ||
                    (widget.scrollController?.offset ?? 0) < 250)
                ? null
                : <BoxShadow>[
                    BoxShadow(
                      color: Colors.white.withValues(alpha: 0.8),
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
      child: Row(children: <Widget>[
        widget.leading,
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: context.width > widget.minWidth
              ? widget.childrens
              : <Widget>[
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        showDialog<void>(
                            barrierColor:
                                context.primaryColor.withValues(alpha: .9),
                            context: context,
                            builder: (_) => Material(
                                  color: Colors.transparent,
                                  child: Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            )),
                                      ),
                                      Expanded(
                                          child: SizedBox(
                                        width: context.width,
                                        child: Card(
                                          elevation: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: widget.childrens,
                                          ).container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20)),
                                        ).container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 20)),
                                      ))
                                    ],
                                  ).container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 25)),
                                ));
                      },
                      icon: widget.menuIcon ??
                          const Icon(
                            Icons.menu,
                            color: textPrimaryColor,
                          )),
                ],
        )),
      ]),
    );
  }
}
