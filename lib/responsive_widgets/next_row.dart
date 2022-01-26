import 'package:bootstrap/responsive_widgets/next_col.dart';
import 'package:flutter/material.dart';
import 'package:bootstrap/extensions/extensions.dart';

class NextRow extends StatelessWidget {
  final List<NextCol> childrens;
  final double verticalSpacing, horizontalSpacing;
  const NextRow(
      {Key? key,
      required this.childrens,
      this.verticalSpacing = 20.0,
      this.horizontalSpacing = 20.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, int> spaceMap = {};
    double checker = 0.0;
    int countRef = 0;
    for (int i = 0; i < childrens.length; i++) {
      NextCol item = childrens.elementAt(i);
      double childWidth = item.getWidthOfChild(context);
      checker += childWidth;

      if (checker == context.width) {
        checker = 0.0;
        countRef = 0;
        int startIndex = spaceMap.isNotEmpty ? spaceMap.length - 1 : 0;
        for (int k = startIndex; k <= i; k++) {
          spaceMap[k] = countRef;
        }
      } else {
        spaceMap[i] = countRef;
      }
      countRef += 1;
    }
    List<Widget> wrapChildrens = [];
    for (NextCol item in childrens) {
      double childWidth = item.getWidthOfChild(context);
      int currentIndex = spaceMap[childrens.indexOf(item)] ?? -1;
      double space = (spaceMap[currentIndex] ?? 1.0) == 0
          ? 1.0
          : (spaceMap[currentIndex] ?? 1).toDouble();
      wrapChildrens.add(SizedBox(
        width: childWidth - (horizontalSpacing / space),
        child: item.child,
      ));
      wrapChildrens.add(SizedBox(
        width: (horizontalSpacing / space),
      ));
    }
    return Wrap(
      runAlignment: WrapAlignment.spaceAround,
      children: wrapChildrens,
    );
  }
}
