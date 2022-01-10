import 'package:flutter/material.dart';

import '../app/fonts.dart';
import '../app/text_styles.dart';
import '../bootstrap_button.dart';
import '../bootstrap_col.dart';
import '../bootstrap_row.dart';
import '../extensions/extensions.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.8,
      child: BootstrapRow(children: [
        BootstrapCol(
            sizes: 'col-12 col-lg-12',
            child: Column(
              children: [
                Text(
                  'One Page Bootstrap\nWebsite Template',
                  style: h1(context),
                  textAlign: TextAlign.center,
                ).translate(animationDuration: const Duration(seconds: 1)),
                Text(
                  'We are team of talented designers',
                  style: h2(context),
                  textAlign: TextAlign.center,
                ).container(const EdgeInsets.only(top: 10)),
                BootstrapButton(
                  color: context.primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                  margin: const EdgeInsets.only(top: 30),
                  onPressed: () {},
                  child: (bool isHovered) => const Text(
                    'Get started',
                    style: TextStyle(
                        fontFamily: Fonts.poppins,
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ))
      ]),
    );
  }
}
