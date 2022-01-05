import 'package:bootstrap/bootstrap_utils.dart';
import 'package:flutter/material.dart';
import 'extensions.dart';

///
/// Implementation of the Bootstrap .container and .container-fluid
///
class BootstrapContainer extends StatelessWidget {
  const BootstrapContainer({
    Key? key,
    this.alignment = Alignment.topCenter,
    required this.children,
    this.fluid = false,
    this.decoration,
    this.scrollController,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  ///
  /// Is the container fluid => if yes, takes the whole width
  /// Default value: false
  ///
  final bool fluid;

  ///
  /// Box Decoration to the widget
  ///
  final BoxDecoration? decoration;

  ///
  /// List of childrens
  ///
  final List<Widget> children;

  ///
  /// Padding
  ///
  final EdgeInsets padding;

  ///
  /// Alignment of children
  ///
  final Alignment alignment;

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      decoration: decoration,
      width: fluid
          ? context.width
          : BootstrapUtils.getMaxWidthForNonFluid(context.width),
      alignment: alignment,
      child: SingleChildScrollView(
        primary: false,
        controller: scrollController,
        padding: padding,
        child: Column(
          children: children,
        ),
      ),
    ));
  }
}
