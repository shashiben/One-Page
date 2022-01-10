import 'package:bootstrap/bootstrap_utils.dart';
import 'package:flutter/material.dart';
import 'package:bootstrap/extensions/extensions.dart';

class ResponsiveGrid extends StatefulWidget {
  final String sizes;
  final List<Widget> childrens;
  final double horizontalSpacing, verticalSpacing;
  const ResponsiveGrid(
      {Key? key,
      required this.sizes,
      required this.childrens,
      this.horizontalSpacing = 20.0,
      this.verticalSpacing = 20.0})
      : super(key: key);

  @override
  State<ResponsiveGrid> createState() => _ResponsiveGridState();
}

class _ResponsiveGridState extends State<ResponsiveGrid> {
  Map<String, int> sizeMap = {};
  List<List<Widget>> childrens = [];
  String type = "";
  void arrangeChildrens() {
    childrens = List.generate(12, (index) => []);
    sizeMap = BootstrapUtils.getAllColValues(widget.sizes);
    type = BootstrapUtils.getPrefixByWidth(context.width);
    int sizeIndex = 0;
    for (Widget child in widget.childrens) {
      childrens[sizeIndex].add(child);
      sizeIndex = (sizeIndex + 1) % (12 ~/ (sizeMap[type]!));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    arrangeChildrens();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildHorizontalChildrens(List.generate(
          12 ~/ (sizeMap[type] ?? 12),
          (index) => Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: _buildVerticalChildrens(childrens[index]),
              )))),
    );
  }

  List<Widget> _buildVerticalChildrens(List<Widget> childrens) {
    List<Widget> result = [];
    for (Widget element in childrens) {
      result.add(element);
      if (childrens.last != element) {
        result.add(SizedBox(
          height: widget.verticalSpacing,
        ));
      }
    }
    return result;
  }

  List<Widget> _buildHorizontalChildrens(List<Widget> childrens) {
    List<Widget> result = [];
    for (Widget element in childrens) {
      result.add(element);
      if (childrens.last != element) {
        result.add(SizedBox(
          width: widget.verticalSpacing,
        ));
      }
    }
    return result;
  }
}
