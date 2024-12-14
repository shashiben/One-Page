import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';

import '../app/fonts.dart';
import '../app/text_styles.dart';
import '../home.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.8,
      child:
          NextRow(verticalAlignment: WrapAlignment.center, children: <NextCol>[
        NextCol(
            widthPercentages: const <GridPrefix, double>{
              GridPrefix.xs: 100,
              GridPrefix.sm: 100,
              GridPrefix.md: 100,
              GridPrefix.lg: 100,
              GridPrefix.xl: 100
            },
            child: Column(
              children: <Widget>[
                Text(
                  'One Page Bootstrap\nWebsite Template',
                  style: h1(context),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'We are team of talented designers',
                  style: h2(context),
                  textAlign: TextAlign.center,
                ).container(padding: const EdgeInsets.only(top: 10)),
                NextButton(
                  color: context.primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  margin: const EdgeInsets.only(top: 30),
                  onPressed: () {
                    Scrollable.ensureVisible(
                        sectionKeys['About']?.currentContext ?? context,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.linear);
                  },
                  style: const TextStyle(
                      fontFamily: Fonts.poppins,
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  child: const Text('Get started'),
                )
              ],
            ).fadeIn(variant: NextFadeInVariant.fadeInTop, initialPosition: 40))
      ]),
    );
  }
}
