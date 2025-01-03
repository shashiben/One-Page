import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class OrderedList extends StatelessWidget {
  const OrderedList(
      {super.key, required this.children, this.spacing = 15, this.leadingIcon});
  final List<Widget> children;
  final double spacing;
  final Widget? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      itemExtent: 50,
      shrinkWrap: true,
      itemCount: children.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) =>
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        leadingIcon ?? const Icon(LineIcons.doubleCheck),
        SizedBox(
          width: spacing,
        ),
        Expanded(child: children[index])
      ]),
    );
  }
}
