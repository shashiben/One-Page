import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';

import '../app/colors.dart';
import '../app/text_styles.dart';
import '../models/feature_model.dart';

class FeatureItem extends StatefulWidget {
  const FeatureItem({super.key, required this.feature});
  final FeatureModel feature;

  @override
  State<FeatureItem> createState() => _FeatureItemState();
}

class _FeatureItemState extends State<FeatureItem>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(
        hoverTransitionDuration: Duration.zero,
        hoverBuilder: (BuildContext context, bool isHovered) {
          if (isHovered) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
          return ScaleTransition(
            scale: Tween<double>(begin: 1.0, end: 1.08).animate(_controller),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: const Color.fromRGBO(18, 66, 101, 0.08),
                    blurRadius: 15,
                    spreadRadius: isHovered ? 10 : 5,
                    offset: Offset(
                      2.0,
                      isHovered ? 6.0 : 2.0,
                    ),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      widget.feature.icon,
                      size: 36,
                      color: context.primaryColor,
                    ).container(
                        padding: const EdgeInsets.only(top: 10, bottom: 20)),
                    Text(
                      widget.feature.title,
                      style: a(context).copyWith(
                          color: isHovered
                              ? context.primaryColor
                              : textPrimaryColor),
                    ).container(padding: const EdgeInsets.only(bottom: 15)),
                    Text(widget.feature.description)
                  ]),
            ),
          );
        });
  }
}
