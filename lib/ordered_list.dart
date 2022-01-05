import 'package:flutter/material.dart';

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
            leadingIcon ?? const Icon(Icons.arrow_circle_right),
            SizedBox(
              width: spacing,
            ),
            Expanded(child: children[index])
          ]),
    );
  }
}
