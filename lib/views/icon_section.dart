import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';

import '../app/data.dart';
import '../models/feature_model.dart';
import '../widgets/feature_item.dart';

class IconSection extends StatelessWidget {
  const IconSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.height * 0.1),
      padding: EdgeInsets.symmetric(
          horizontal: context.isMobile ? 20 : context.width * 0.05),
      child: NextRow(
          verticalSpacing: 30,
          children: featuresList
              .map((FeatureModel e) => NextCol(
                    widthPercentages: const <GridPrefix, double>{
                      GridPrefix.xs: 100,
                      GridPrefix.sm: 100,
                      GridPrefix.md: 50,
                      GridPrefix.lg: 25,
                      GridPrefix.xl: 25
                    },
                    child: FeatureItem(
                      feature: e,
                    ).zoom(
                        viewPort: 0.28,
                        duration: const Duration(milliseconds: 300)),
                  ))
              .toList()),
    );
  }
}
