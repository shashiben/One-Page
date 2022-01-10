import 'package:flutter/material.dart';

import '../bootstrap_utils.dart';
import '../extensions/extensions.dart';

class ResponsiveStaggeredgridView extends StatefulWidget {
  final String sizes;
  const ResponsiveStaggeredgridView({Key? key, required this.sizes})
      : super(key: key);

  @override
  _ResponsiveStaggeredgridViewState createState() =>
      _ResponsiveStaggeredgridViewState();
}

class _ResponsiveStaggeredgridViewState
    extends State<ResponsiveStaggeredgridView> {
  List<Widget> childrens = [];
  List<Widget> horizontalChildrens = [];
  @override
  Widget build(BuildContext context) {
    final Map<String, int> siz = BootstrapUtils.getAllColValues(widget.sizes);
    final String currentSize = BootstrapUtils.getPrefixByWidth(context.width);
    childrens.clear();
    horizontalChildrens.clear();
    for (int i = 0; i < (siz[currentSize] ?? 0) % 12; i++) {
      horizontalChildrens.addAll(<Widget>[]);
    }
    return Container();
  }
}
