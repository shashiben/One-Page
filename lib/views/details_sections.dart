import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';

import '../app/data.dart';
import '../app/fonts.dart';
import '../widgets/text_counter.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFF8FBFE),
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: NextRow(
          children: details.entries
              .map((MapEntry<String, int> e) => NextCol(
                      widthPercentages: const <GridPrefix, double>{
                        GridPrefix.xs: 50,
                        GridPrefix.sm: 50,
                        GridPrefix.md: 50,
                        GridPrefix.lg: 25,
                        GridPrefix.xl: 25,
                        GridPrefix.xxl: 25,
                      },
                      child: Column(
                        children: <Widget>[
                          AnimatedCounter(
                              begin: 0,
                              duration: const Duration(seconds: 5),
                              end: e.value.toDouble(),
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
                          ).container(padding: const EdgeInsets.only(top: 8))
                        ],
                      )))
              .toList()),
    );
  }
}
