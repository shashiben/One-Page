import 'package:flutter/gestures.dart';
import 'package:line_icons/line_icons.dart';
import 'package:one_page/services/url_service.dart';

import '../app/colors.dart';
import '../app/fonts.dart';

import 'package:flutter_next/flutter_next.dart';
import '../widgets/footer_item.dart';
import '../widgets/news_letter.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

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
                sizes: 'col-12 cik-md-6 col-lg-3',
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
                sizes: 'col-12 col-md-6 col-lg-2',
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
                sizes: 'col-12 col-md-6 col-lg-3',
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
            const NextCol(
                sizes: 'col-12 col-md-6 col-lg-4', child: NewsLetterWidget())
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
                  sizes: 'col-12 col-md-6',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text.rich(TextSpan(
                          style: TextStyle(
                            fontFamily: Fonts.openSans,
                          ),
                          children: [
                            TextSpan(text: '© Created by '),
                            TextSpan(
                                text: 'Shashi. ',
                                style: TextStyle(
                                    fontFamily: Fonts.openSans,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(text: 'With Flutter.'),
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
                  sizes: 'col-12 col-lg-6 col-md-6',
                  child: Row(
                    mainAxisAlignment: context.isMobile
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 40,
                        child: NextButton(
                            margin: const EdgeInsets.only(right: 10),
                            itemBuilder: (context, bool isHovered) =>
                                const Icon(
                                  Icons.facebook_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                            onPressed: () {
                              UrlService.launchUrl(
                                  "https://www.facebook.com/shashiben7997");
                            }),
                      ),
                      SizedBox(
                        width: 50,
                        height: 40,
                        child: NextButton(
                            margin: const EdgeInsets.only(right: 10),
                            itemBuilder: (context, isHovered) => const Icon(
                                  LineIcons.instagram,
                                  color: Colors.white,
                                  size: 20,
                                ),
                            onPressed: () {
                              UrlService.launchUrl(
                                  "https://www.instagram.com/shashikumar7997/");
                            }),
                      ),
                      SizedBox(
                        width: 50,
                        height: 40,
                        child: NextButton(
                            margin: const EdgeInsets.only(right: 10),
                            itemBuilder: (context, isHovered) => const Icon(
                                  LineIcons.linkedinIn,
                                  color: Colors.white,
                                  size: 20,
                                ),
                            onPressed: () {
                              UrlService.launchUrl(
                                  "https://www.linkedin.com/in/shashi-kumar-58ab1b1a4/");
                            }),
                      ),
                      SizedBox(
                        width: 50,
                        height: 40,
                        child: NextButton(
                            margin: const EdgeInsets.only(right: 10),
                            itemBuilder: (context, bool isHovered) =>
                                const Icon(
                                  LineIcons.github,
                                  color: Colors.white,
                                  size: 20,
                                ),
                            onPressed: () {
                              UrlService.launchUrl(
                                  "https://github.com/shashiben");
                            }),
                      ),
                      SizedBox(
                        width: 50,
                        height: 40,
                        child: NextButton(
                            margin: const EdgeInsets.only(right: 10),
                            itemBuilder: (context, bool isHovered) =>
                                const Icon(
                                  LineIcons.medium,
                                  color: Colors.white,
                                  size: 20,
                                ),
                            onPressed: () {
                              UrlService.launchUrl(
                                  "https://medium.com/@ben75930");
                            }),
                      ),
                    ],
                  ))
            ]),
          ),
        ),
      ],
    );
  }
}
