import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';

import '../widgets/company_logo_item.dart';

class ClientSection extends StatelessWidget {
  const ClientSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8FBFE),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: context.width,
      child: NextRow(
        children: List<NextCol>.generate(
            6,
            (int index) => NextCol(
                    widthPercentages: const <GridPrefix, double>{
                      GridPrefix.xs: 6,
                      GridPrefix.sm: 6,
                      GridPrefix.md: 4,
                      GridPrefix.lg: 2,
                      GridPrefix.xl: 2,
                      GridPrefix.xxl: 2,
                    },
                    child: CompanyLogoItem(
                      image: 'assets/clients/client-${index + 1}.png',
                    )
                        .container(
                            padding: const EdgeInsets.symmetric(horizontal: 15))
                        .zoom(
                          duration: const Duration(milliseconds: 300),
                        ))),
      ),
    );
  }
}
