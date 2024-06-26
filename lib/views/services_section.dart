import '../app/data.dart';
import '../app/text_styles.dart';

import 'package:flutter_next/flutter_next.dart';
import 'package:flutter/material.dart';
import '../widgets/service_item.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      padding: const EdgeInsets.symmetric(vertical: 60),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFFDFDFD),
      ),
      child: Column(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SERVICES',
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
          initialPosition: 80,
        ),
        SizedBox(
          width: context.isMobile ? context.width * 0.92 : context.width * 0.8,
          child: NextRow(verticalSpacing: 30, children: [
            ...List.generate(
                servicesList.length,
                (index) => NextCol(
                        widthPercentages: const {
                          GridPrefix.xs: 100,
                          GridPrefix.sm: 100,
                          GridPrefix.md: 50,
                          GridPrefix.lg: 33.33,
                          GridPrefix.xl: 33.33
                        },
                        child: ServiceItem(
                          serviceModel: servicesList[index],
                        ).zoom(
                          viewPort: index > 2 ? 0.05 : 0.2,
                        ))),
          ]),
        ),
      ]),
    );
  }
}
