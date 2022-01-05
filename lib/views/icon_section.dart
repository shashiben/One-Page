import 'package:bootstrap/app/data.dart';
import 'package:bootstrap/bootstrap_col.dart';
import 'package:bootstrap/bootstrap_row.dart';
import 'package:bootstrap/widgets/feature_item.dart';
import 'package:flutter/material.dart';
import 'package:bootstrap/extensions.dart';

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
              .map((e) => BootstrapCol(
                    child: FeatureItem(
                      feature: e,
                    ),
                    sizes: "col-12 col-lg-3 col-md-6 col-sm-12",
                  ))
              .toList()),
    );
  }
}
