import 'package:flutter/material.dart';

import 'bootstrap_col.dart';

class BootstrapRow extends StatelessWidget {
  final List<BootstrapCol> children;
  final int rowSegments;
  final double horizontalSpacing;
  final double verticalSpacing;
  final CrossAxisAlignment horizontalAlignment;
  final MainAxisAlignment verticalAlignment;
  final MainAxisAlignment gridHorizontalAlignment;
  final CrossAxisAlignment gridVerticalAlignment;
  final EdgeInsets padding;

  const BootstrapRow(
      {Key? key,
      this.horizontalSpacing = 0.0,
      this.padding = const EdgeInsets.all(0),
      this.verticalSpacing = 0.0,
      this.verticalAlignment = MainAxisAlignment.center,
      this.horizontalAlignment = CrossAxisAlignment.center,
      this.gridHorizontalAlignment = MainAxisAlignment.center,
      this.gridVerticalAlignment = CrossAxisAlignment.center,
      required this.children,
      this.rowSegments = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> horizontalChildrens = [];
    List<Widget> verticalChildrens = [];
    int accumulatedWidth = 0;
      for (var col in children) {
        var colWidth = col.currentConfig(context) ?? 1;
        if (accumulatedWidth + colWidth > rowSegments) {
          if (accumulatedWidth < rowSegments) {
            verticalChildrens.add(Spacer(
              flex: rowSegments - accumulatedWidth,
            ));
          }

          horizontalChildrens.add(Row(
            crossAxisAlignment: gridVerticalAlignment,
            mainAxisAlignment: gridHorizontalAlignment,
            mainAxisSize: MainAxisSize.max,
            children: verticalChildrens,
          ));
          horizontalChildrens.add(SizedBox(
            height: verticalSpacing,
          ));

          verticalChildrens = <Widget>[];
          accumulatedWidth = 0;
        }

        verticalChildrens.add(col);
        accumulatedWidth += colWidth;

        verticalChildrens.add(SizedBox(
          width: horizontalSpacing,
        ));
      }

      if (accumulatedWidth >= 0) {
        if (accumulatedWidth < rowSegments) {
          verticalChildrens.add(Spacer(
            flex: rowSegments - accumulatedWidth,
          ));
        }

        horizontalChildrens.add(Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: gridVerticalAlignment,
          mainAxisAlignment: gridHorizontalAlignment,
          children: verticalChildrens,
        ));
      }
    

    return Container(
      padding: padding,
      child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: horizontalAlignment,
              mainAxisAlignment: verticalAlignment,
              children: horizontalChildrens,
            )
          ,
    );
  }
}