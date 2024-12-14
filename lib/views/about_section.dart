import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';

import '../app/fonts.dart';
import '../app/text_styles.dart';
import '../home.dart';
import '../ordered_list.dart';
import 'details_sections.dart';
import 'video_section.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          NextRow(
              padding:
                  EdgeInsets.symmetric(horizontal: context.isMobile ? 20 : 40),
              children: <NextCol>[
                NextCol(
                    widthPercentages: const <GridPrefix, double>{
                      GridPrefix.xs: 100,
                      GridPrefix.sm: 100,
                      GridPrefix.md: 100,
                      GridPrefix.lg: 100,
                      GridPrefix.xl: 100,
                    },
                    child: Column(
                      children: <Widget>[
                        Text(
                          'ABOUT US',
                          style: SectionTitle.h2(context),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem.',
                          style: SectionTitle.p(context),
                          textAlign: TextAlign.center,
                        ).container(
                            padding:
                                const EdgeInsets.only(top: 10, bottom: 20)),
                        NextRow(children: <NextCol>[
                          NextCol(
                              widthPercentages: const <GridPrefix, double>{
                                GridPrefix.xs: 100,
                                GridPrefix.sm: 100,
                                GridPrefix.md: 100,
                                GridPrefix.lg: 50,
                                GridPrefix.xl: 50
                              },
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                    style: SectionTitle.p(context).copyWith(
                                        color: const Color(0xFF444444)),
                                  ).container(
                                      padding:
                                          const EdgeInsets.only(bottom: 15)),
                                  OrderedList(
                                      children: <String>[
                                    'Ullamco laboris nisi ut aliquip ex ea commodo consequat',
                                    'Duis aute irure dolor in reprehenderit in voluptate velit',
                                    'Ullamco laboris nisi ut aliquip ex ea commodo consequat'
                                  ]
                                          .map((String e) => Text(
                                                e,
                                                style:
                                                    AboutTextStyles.li(context),
                                              ))
                                          .toList())
                                ],
                              )),
                          NextCol(
                              widthPercentages: const <GridPrefix, double>{
                                GridPrefix.xs: 100,
                                GridPrefix.sm: 100,
                                GridPrefix.md: 100,
                                GridPrefix.lg: 50,
                                GridPrefix.xl: 50
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                    style: SectionTitle.p(context).copyWith(
                                        color: const Color(0xFF444444)),
                                  ),
                                  NextButton(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 12),
                                    margin: const EdgeInsets.only(top: 30),
                                    style: const TextStyle(
                                      fontFamily: Fonts.openSans,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    onPressed: () {
                                      Scrollable.ensureVisible(
                                          sectionKeys['Home']?.currentContext ??
                                              context,
                                          duration:
                                              const Duration(milliseconds: 800),
                                          curve: Curves.linear);
                                    },
                                    variant: NextButtonVariant.outlined,
                                    child: const Text('Learn More'),
                                  )
                                ],
                              ))
                        ])
                      ],
                    ).fadeIn(
                      initialPosition: 50,
                      variant: NextFadeInVariant.fadeInTop,
                    )),
              ]),
          const DetailsSection()
              .container(padding: const EdgeInsets.symmetric(vertical: 60)),
          const VideoSection()
        ],
      ).container(padding: const EdgeInsets.only(top: 60)),
    );
  }
}
