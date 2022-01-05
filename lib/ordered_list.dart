import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class OrderedList extends StatelessWidget {
  final List<Widget> children;
  final double spacing;
  final Widget? leadingIcon;
  const OrderedList(
      {Key? key, required this.children, this.spacing = 15, this.leadingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: children.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leadingIcon ?? const Icon(LineIcons.arrowCircleRight),
            SizedBox(
              width: spacing,
            ),
            Expanded(child: children[index])
          ]),
    );
  }
}
