import 'package:bootstrap/bootstrap_utils.dart';
import 'package:flutter/material.dart';

class NextCol extends StatelessWidget {
  final String sizes;
  final Widget child;
  const NextCol({Key? key, required this.sizes, required this.child})
      : super(key: key);
  double getWidthOfChild(context) {
    return BootstrapUtils.getMaxWidth(sizes, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: child,
      width: BootstrapUtils.getMaxWidth(sizes, context: context),
    );
  }
}
