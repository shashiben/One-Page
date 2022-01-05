import 'package:bootstrap/Ordered_List.dart';
import 'package:bootstrap/app/text_styles.dart';
import 'package:bootstrap/bootstrap_button.dart';
import 'package:bootstrap/bootstrap_col.dart';
import 'package:bootstrap/views/details_sections.dart';
import 'package:bootstrap/views/video_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bootstrap_row.dart';
import 'package:bootstrap/extensions.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BootstrapRow(
              padding:
                  EdgeInsets.symmetric(horizontal: context.isMobile ? 20 : 40),
              children: [
                BootstrapCol(
                    sizes: "col-12 col-lg-12",
                    child: Column(
                      children: [
                        Text(
                          "ABOUT US",
                          style: SectionTitle.h2(context),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem.",
                          style: SectionTitle.p(context),
                          textAlign: TextAlign.center,
                        ).padding(const EdgeInsets.only(top: 10, bottom: 20)),
                        BootstrapRow(verticalSpacing: 20, children: [
                          BootstrapCol(
                              sizes: "col-12 col-lg-6 col-md-12",
                              child: Column(
                                children: [
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                    style: SectionTitle.p(context).copyWith(
                                        color: const Color(0xFF444444)),
                                  ).padding(const EdgeInsets.only(bottom: 15)),
                                  OrderedList(
                                      leadingIcon: const Icon(Icons.checklist),
                                      children: [
                                        "Ullamco laboris nisi ut aliquip ex ea commodo consequat",
                                        "Duis aute irure dolor in reprehenderit in voluptate velit",
                                        "Ullamco laboris nisi ut aliquip ex ea commodo consequat"
                                      ]
                                          .map((e) => Text(
                                                e,
                                                style:
                                                    AboutTextStyles.li(context),
                                              ))
                                          .toList())
                                ],
                              )),
                          BootstrapCol(
                              sizes: "col-12 col-lg-6 col-md-12",
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                    style: SectionTitle.p(context).copyWith(
                                        color: const Color(0xFF444444)),
                                  ),
                                  BootstrapButton(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 14),
                                    margin: const EdgeInsets.only(top: 30),
                                    child: (isHovered) => Text(
                                      "Learn More",
                                      style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.bold,
                                          color: isHovered
                                              ? Colors.white
                                              : context.themeData.primaryColor),
                                    ),
                                    onPressed: () {},
                                    variant: ButtonVariant.outlined,
                                  )
                                ],
                              ))
                        ])
                      ],
                    )),
              ]),
          const DetailsSection()
              .padding(const EdgeInsets.symmetric(vertical: 60)),
          const VideoSection()
        ],
      ).padding(const EdgeInsets.only(top: 60)),
    );
  }
}
