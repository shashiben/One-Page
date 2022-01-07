import 'package:flutter/material.dart';

import '../bootstrap_col.dart';
import '../bootstrap_row.dart';
import '../extensions.dart';
import '../widgets/company_logo_item.dart';

class ClientSection extends StatelessWidget {
  const ClientSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8FBFE),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: context.width,
      child: BootstrapRow(
        verticalSpacing: 20,
        children: List.generate(
            6,
            (int index) => BootstrapCol(
                sizes: 'col-lg-2 col-md-4 col-6 col-sm-6 col-xs-6',
                child: CompanyLogoItem(
                  image: 'assets/clients/client-${index + 1}.png',
                ).padding(const EdgeInsets.symmetric(horizontal: 15)))),
      ),
    );
  }
}
