import 'package:flutter/gestures.dart';
import 'package:one_page/app/data.dart';
import 'package:one_page/services/url_service.dart';

import '../app/colors.dart';
import '../app/fonts.dart';

import 'package:flutter_next/flutter_next.dart';
import 'package:flutter/material.dart';
import '../widgets/footer_item.dart';
import '../widgets/news_letter.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: context.isMobile ? 20 : context.width * 0.05,
              vertical: 40),
          color: Colors.white,
          width: context.width,
          child: NextRow(verticalSpacing: 30, children: [
            NextCol(
                widthPercentages: const {
                  GridPrefix.xs: 100,
                  GridPrefix.sm: 100,
                  GridPrefix.md: 50,
                  GridPrefix.lg: 25,
                  GridPrefix.xl: 25
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'OnePage',
                      style: TextStyle(
                          fontFamily: Fonts.raleway,
                          fontSize: 26,
                          color: Color(0xFF444444)),
                    ).container(padding: const EdgeInsets.only(bottom: 10)),
                    const Text(
                      'A108 Adam Street\nNew York, NY 535022\nUnited States',
                      style: TextStyle(
                          fontFamily: Fonts.raleway,
                          height: 1.5,
                          fontSize: 14,
                          color: Color(0xFF777777)),
                    ).container(padding: const EdgeInsets.only(bottom: 15)),
                    const Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'Phone:',
                          style: TextStyle(
                              fontFamily: Fonts.raleway,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xFF444444))),
                      TextSpan(
                          text: '+91-7997217156',
                          style: TextStyle(
                              fontFamily: Fonts.raleway,
                              fontSize: 14,
                              color: Color(0xFF777777)))
                    ])).container(padding: const EdgeInsets.only(bottom: 8)),
                    const Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'Email:',
                          style: TextStyle(
                              fontFamily: Fonts.raleway,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Color(0xFF444444))),
                      TextSpan(
                          text: 'kumarshashi5294@gmail.com',
                          style: TextStyle(
                              fontFamily: Fonts.raleway,
                              fontSize: 14,
                              color: Color(0xFF777777)))
                    ]))
                  ],
                )),
            NextCol(
                widthPercentages: const {
                  GridPrefix.xs: 100,
                  GridPrefix.sm: 100,
                  GridPrefix.md: 50,
                  GridPrefix.lg: 16.66,
                  GridPrefix.xl: 16.66
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Useful Links',
                      style: TextStyle(
                          fontFamily: Fonts.raleway,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: textPrimaryColor),
                    ).container(padding: const EdgeInsets.only(bottom: 12)),
                    const FooterItem(title: 'Home'),
                    const FooterItem(title: 'About us'),
                    const FooterItem(title: 'Services'),
                    const FooterItem(title: 'Terms of service'),
                    const FooterItem(title: 'Privacy policy'),
                  ],
                )),
            NextCol(
                widthPercentages: const {
                  GridPrefix.xs: 100,
                  GridPrefix.sm: 100,
                  GridPrefix.md: 50,
                  GridPrefix.lg: 25,
                  GridPrefix.xl: 25
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Our Services',
                      style: TextStyle(
                          fontFamily: Fonts.raleway,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: textPrimaryColor),
                    ).container(padding: const EdgeInsets.only(bottom: 12)),
                    const FooterItem(title: 'Web Design'),
                    const FooterItem(title: 'Web Development'),
                    const FooterItem(title: 'Product Management'),
                    const FooterItem(title: 'Marketing'),
                    const FooterItem(title: 'Graphic Design'),
                  ],
                )),
            const NextCol(widthPercentages: {
              GridPrefix.xs: 100,
              GridPrefix.sm: 100,
              GridPrefix.md: 50,
              GridPrefix.lg: 25,
              GridPrefix.xl: 25
            }, child: NewsLetterWidget())
          ]),
        ),
        Container(
          color: const Color(0xFFF8FBFE),
          padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: context.isMobile ? 20 : context.width * 0.05),
          width: context.width,
          child: Container(
            color: const Color(0xFFF8FBFE),
            width: context.width,
            child: NextRow(verticalSpacing: 15, children: [
              NextCol(
                  widthPercentages: const {
                    GridPrefix.xs: 100,
                    GridPrefix.sm: 100,
                    GridPrefix.md: 50,
                    GridPrefix.lg: 50,
                    GridPrefix.xl: 50
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(TextSpan(
                          style: const TextStyle(
                            fontFamily: Fonts.openSans,
                          ),
                          children: [
                            const TextSpan(text: '© Created by '),
                            TextSpan(
                                text: 'Shashi. ',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    UrlService.launchUrl(
                                        "https://github.com/shashiben");
                                  },
                                style: const TextStyle(
                                    fontFamily: Fonts.openSans,
                                    fontWeight: FontWeight.bold)),
                            const TextSpan(text: 'With Flutter.'),
                          ])).container(
                          padding: const EdgeInsets.only(bottom: 10)),
                      Text.rich(TextSpan(
                          style: const TextStyle(
                            fontFamily: Fonts.openSans,
                          ),
                          children: [
                            const TextSpan(text: 'With the help of '),
                            TextSpan(
                                text: 'Flutter Next ',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    UrlService.launchUrl(
                                        "https://pub.dev/packages/flutter_next");
                                  },
                                style: TextStyle(
                                    fontFamily: Fonts.openSans,
                                    color: context.primaryColor,
                                    fontWeight: FontWeight.bold)),
                          ])),
                    ],
                  )),
              NextCol(
                  widthPercentages: const {
                    GridPrefix.xs: 100,
                    GridPrefix.sm: 100,
                    GridPrefix.md: 50,
                    GridPrefix.lg: 50,
                    GridPrefix.xl: 50
                  },
                  child: Row(
                      mainAxisAlignment: context.isMobile
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.end,
                      children: List.generate(
                        socialLinks.length,
                        (index) => NextButton(
                            margin: const EdgeInsets.only(right: 10),
                            itemBuilder: (context, bool isHovered, color) =>
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: context.primaryColor),
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    socialLinks[index].icon,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                            onPressed: () {
                              UrlService.launchUrl(socialLinks[index].url);
                            }),
                      )))
            ]),
          ),
        ),
      ],
    );
  }
}
