import 'package:one_page/app/fonts.dart';
import 'package:one_page/home.dart';
import '../app/text_styles.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:flutter/material.dart';
import '../ordered_list.dart';
import 'details_sections.dart';
import 'video_section.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NextRow(
              padding:
                  EdgeInsets.symmetric(horizontal: context.isMobile ? 20 : 40),
              children: [
                NextCol(
                    sizes: 'col-12 col-lg-12',
                    child: Column(
                      children: [
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
                        NextRow(children: [
                          NextCol(
                              sizes: 'col-12 col-lg-6 col-md-12',
                              child: Column(
                                children: [
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                    style: SectionTitle.p(context).copyWith(
                                        color: const Color(0xFF444444)),
                                  ).container(
                                      padding:
                                          const EdgeInsets.only(bottom: 15)),
                                  OrderedList(
                                      children: [
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
                              sizes: 'col-12 col-lg-6 col-md-12',
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                    style: SectionTitle.p(context).copyWith(
                                        color: const Color(0xFF444444)),
                                  ),
                                  NextButton(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 12),
                                    margin: const EdgeInsets.only(top: 30),
                                    child: const Text("Learn More"),
                                    style: const TextStyle(
                                      fontFamily: Fonts.openSans,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    onPressed: () {
                                      Scrollable.ensureVisible(
                                          sectionKeys["Home"]?.currentContext ??
                                              context,
                                          duration:
                                              const Duration(milliseconds: 800),
                                          curve: Curves.linear);
                                    },
                                    variant: NextButtonVariant.outlined,
                                  )
                                ],
                              ))
                        ])
                      ],
                    ).fadeIn(
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
