import 'package:flutter/material.dart';

import '../app/data.dart';
import '../app/text_styles.dart';
import '../bootstrap_col.dart';
import '../bootstrap_row.dart';
import '../extensions.dart';
import '../models/pricing_model.dart';
import '../widgets/pricing_item.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFFDFDFD),
      ),
      child: Column(children: [
        Text(
          'PRICING',
          style: SectionTitle.h2(context),
        ).padding(const EdgeInsets.only(bottom: 20)),
        SizedBox(
          width: context.isMobile ? context.width - 40 : context.width * 0.8,
          child: Text(
            'Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.',
            style: SectionTitle.p(context),
            textAlign: TextAlign.center,
          ).padding(const EdgeInsets.only(bottom: 30)),
        ),
        SizedBox(
          width: context.width * 0.8,
          child: BootstrapRow(
              horizontalSpacing: 10,
              verticalSpacing: 30,
              verticalAlignment: MainAxisAlignment.start,
              children: [
                ...priceList
                    .map((PricingModel e) => BootstrapCol(
                          sizes: 'col-6 col-md-6 col-lg-4 col-xs-12',
                          child: PricingItem(
                            index: priceList.indexOf(e),
                            pricingModel: e,
                            isActive: priceList.indexOf(e) == 1,
                          ),
                        ))
                    .toList()
              ]),
        ),
      ]),
    );
  }
}
