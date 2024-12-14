import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';

import '../app/data.dart';
import '../app/text_styles.dart';
import '../models/pricing_model.dart';
import '../widgets/pricing_item.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFFDFDFD),
      ),
      child: Column(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'PRICING',
              style: SectionTitle.h2(context),
            ).container(padding: const EdgeInsets.only(bottom: 20)),
            SizedBox(
              width:
                  context.isMobile ? context.width - 40 : context.width * 0.8,
              child: Text(
                'Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.',
                style: SectionTitle.p(context),
                textAlign: TextAlign.center,
              ).container(padding: const EdgeInsets.only(bottom: 30)),
            ),
          ],
        ).fadeIn(
            variant: NextFadeInVariant.fadeInTop,
            initialPosition: 50,
            duration: const Duration(milliseconds: 300)),
        LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            width: constraints.maxWidth * 0.8,
            child: NextRow(
                horizontalSpacing: 10,
                verticalSpacing: 30,
                children: <NextCol>[
                  ...priceList.map((PricingModel e) => NextCol(
                        widthPercentages: const <GridPrefix, double>{
                          GridPrefix.xs: 100,
                          GridPrefix.sm: 100,
                          GridPrefix.md: 50,
                          GridPrefix.lg: 25,
                          GridPrefix.xl: 25
                        },
                        child: PricingItem(
                          index: priceList.indexOf(e),
                          pricingModel: e,
                          isActive: priceList.indexOf(e) == 1,
                        ).zoom(
                          duration: const Duration(milliseconds: 400),
                        ),
                      ))
                ]),
          );
        }),
      ]),
    );
  }
}
