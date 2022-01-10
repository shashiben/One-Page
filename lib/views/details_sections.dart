import 'package:flutter/material.dart';

import '../app/data.dart';
import '../app/fonts.dart';
import '../bootstrap_col.dart';
import '../bootstrap_row.dart';
import '../extensions/extensions.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF8FBFE),
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: BootstrapRow(
          children: details.entries
              .map((MapEntry<String, int> e) => BootstrapCol(
                  sizes: 'col-6 col-md-6 col-lg-3 col-sm-6 col-xs-6',
                  child: Column(
                    children: [
                      Text('${e.value}',
                          style: const TextStyle(
                              fontFamily: Fonts.openSans,
                              fontWeight: FontWeight.w700,
                              fontSize: 48,
                              color: Color(0xFF124265))),
                      Text(
                        e.key,
                        style: const TextStyle(
                            fontFamily: Fonts.raleway,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ).padding(const EdgeInsets.only(top: 8))
                    ],
                  )))
              .toList()),
    );
  }
}
