import 'package:bootstrap/app/colors.dart';
import 'package:bootstrap/app/text_styles.dart';
import 'package:bootstrap/bootstrap_button.dart';
import 'package:bootstrap/bootstrap_col.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bootstrap_row.dart';
import 'package:bootstrap/extensions.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.8,
      child: BootstrapRow(children: [
        BootstrapCol(
            sizes: "col-12 col-lg-12",
            child: Column(
              children: [
                Text(
                  "One Page Bootstrap\nWebsite Template",
                  style: h1(context),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "We are team of talented designers",
                  style: h2(context),
                  textAlign: TextAlign.center,
                ).padding(const EdgeInsets.only(top: 10)),
                BootstrapButton(
                  color: primaryColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                  margin: const EdgeInsets.only(top: 30),
                  onPressed: () {},
                  child: (isHovered) => Text(
                    "Get started",
                    style: GoogleFonts.poppins(
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