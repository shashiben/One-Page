import 'package:bootstrap/app/data.dart';
import 'package:bootstrap/app/text_styles.dart';
import 'package:bootstrap/bootstrap_col.dart';
import 'package:bootstrap/bootstrap_row.dart';
import 'package:bootstrap/widgets/service_item.dart';
import 'package:flutter/material.dart';
import 'package:bootstrap/extensions.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      padding: const EdgeInsets.symmetric(vertical: 60),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xFFFDFDFD),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          "SERVICES",
          style: SectionTitle.h2(context),
        ).padding(const EdgeInsets.only(bottom: 20)),
        SizedBox(
          width: context.isMobile ? context.width - 40 : context.width * 0.8,
          child: Text(
            "Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.",
            style: SectionTitle.p(context),
            textAlign: TextAlign.center,
          ).padding(const EdgeInsets.only(bottom: 30)),
        ),
        SizedBox(
          width: context.isMobile ? context.width * 0.92 : context.width * 0.8,
          child: BootstrapRow(
              horizontalSpacing: 20,
              verticalSpacing: 30,
              verticalAlignment: MainAxisAlignment.start,
              children: [
                ...servicesList
                    .map((e) => BootstrapCol(
                        sizes: "col-6 col-lg-4 col-md-6 col-xs-12",
                        child: ServiceItem(
                          serviceModel: e,
                        )))
                    .toList()
              ]),
        ),
      ]),
    );
  }
}
