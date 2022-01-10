import 'package:flutter/material.dart';

import '../app/data.dart';
import '../bootstrap_col.dart';
import '../bootstrap_row.dart';
import '../extensions/extensions.dart';
import '../models/feature_model.dart';
import '../widgets/feature_item.dart';

class IconSection extends StatelessWidget {
  const IconSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.height * 0.1),
      padding: EdgeInsets.symmetric(
          horizontal: context.isMobile ? 20 : context.width * 0.05),
      child: BootstrapRow(
          verticalSpacing: 30,
          horizontalSpacing: 20,
          children: featuresList
              .map((FeatureModel e) => BootstrapCol(
                    sizes: 'col-12 col-lg-3 col-md-6 col-sm-12',
                    child: FeatureItem(
                      feature: e,
                    ),
                  ))
              .toList()),
    );
  }
}
