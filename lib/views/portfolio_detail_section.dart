import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:go_router/go_router.dart';

import '../app/fonts.dart';
import 'footer_section.dart';
import 'header_section.dart';

class PortfolioDetailSection extends StatefulWidget {
  const PortfolioDetailSection({super.key});

  @override
  State<PortfolioDetailSection> createState() => _PortfolioDetailSectionState();
}

class _PortfolioDetailSectionState extends State<PortfolioDetailSection> {
  int currentIndex = 0;
  late CarouselSliderController pageController;
  @override
  void initState() {
    super.initState();
    pageController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const HeaderSection(
            titles: <String>[],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: const Color(0xFFF8FBFE),
                      padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal:
                              context.isMobile ? 20 : context.width * 0.05),
                      width: context.width,
                      child: NextRow(children: <NextCol>[
                        const NextCol(
                            widthPercentages: <GridPrefix, double>{
                              GridPrefix.xs: 100,
                              GridPrefix.sm: 100,
                              GridPrefix.md: 100,
                              GridPrefix.lg: 50,
                              GridPrefix.xl: 50
                            },
                            child: Text('Portfolio Details',
                                style: TextStyle(
                                    fontFamily: Fonts.raleway,
                                    color: Color(0xFF444444),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w300))),
                        NextCol(
                            widthPercentages: const <GridPrefix, double>{
                              GridPrefix.xs: 100,
                              GridPrefix.sm: 100,
                              GridPrefix.md: 100,
                              GridPrefix.lg: 50,
                              GridPrefix.xl: 50
                            },
                            child: Row(
                              mainAxisAlignment: context.width > 992
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: <Widget>[
                                Text.rich(TextSpan(
                                    text: 'Home   ',
                                    style: TextStyle(
                                        fontFamily: Fonts.openSans,
                                        fontSize: 14,
                                        color: context.primaryColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        GoRouter.of(context).pop();
                                      },
                                    children: const <InlineSpan>[
                                      TextSpan(
                                        text: '/   ',
                                        style: TextStyle(
                                            fontFamily: Fonts.openSans,
                                            fontSize: 14,
                                            color: Color(0xff444444)),
                                      ),
                                      TextSpan(
                                        text: 'Portfolio Details',
                                        style: TextStyle(
                                            fontFamily: Fonts.openSans,
                                            fontSize: 14,
                                            color: Color(0xff444444)),
                                      )
                                    ]))
                              ],
                            ))
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              context.isMobile ? 20 : context.width * 0.05),
                      margin: const EdgeInsets.only(top: 40, bottom: 80),
                      child: NextRow(
                        children: <NextCol>[
                          NextCol(
                            widthPercentages: const <GridPrefix, double>{
                              GridPrefix.xs: 12,
                              GridPrefix.sm: 12,
                              GridPrefix.md: 12,
                              GridPrefix.lg: 66.66,
                              GridPrefix.xl: 66.66
                            },
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                    height:
                                        context.isMobile ? 250 : context.height,
                                    width: context.width,
                                    child: ScrollConfiguration(
                                      behavior: ScrollConfiguration.of(context)
                                          .copyWith(
                                        dragDevices: <PointerDeviceKind>{
                                          PointerDeviceKind.touch,
                                          PointerDeviceKind.mouse,
                                        },
                                      ),
                                      child: CarouselSlider(
                                        carouselController: pageController,
                                        options: CarouselOptions(
                                            onPageChanged: (int index,
                                                CarouselPageChangedReason
                                                    reason) {
                                              setState(() {
                                                currentIndex = index;
                                              });
                                            },
                                            viewportFraction: 1),
                                        items: List<Widget>.generate(
                                            3,
                                            (int index) => Image.asset(
                                                  'assets/portfolio/portfolio-${index + 1}.jpg',
                                                  fit: context.isMobile
                                                      ? BoxFit.fitHeight
                                                      : BoxFit.fitWidth,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                )),
                                      ),
                                    )),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List<Widget>.generate(
                                        3,
                                        (int index) => AnimatedContainer(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: index == currentIndex
                                                    ? context.primaryColor
                                                    : context.primaryColor
                                                        .withValues(alpha: .4)),
                                            duration: const Duration(
                                                milliseconds: 300)))).container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40))
                              ],
                            ),
                          ),
                          NextCol(
                              widthPercentages: const <GridPrefix, double>{
                                GridPrefix.xs: 12,
                                GridPrefix.sm: 12,
                                GridPrefix.md: 12,
                                GridPrefix.lg: 33.33,
                                GridPrefix.xl: 33.33
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(30),
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        const Text(
                                          'Project Information',
                                          style: TextStyle(
                                              fontFamily: Fonts.raleway,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700),
                                        ).container(
                                            padding: const EdgeInsets.only(
                                                bottom: 20)),
                                        const Divider().container(
                                            padding: const EdgeInsets.only(
                                                bottom: 10)),
                                        cardBody('Category', 'Web design'),
                                        cardBody('Client', 'ASU Company'),
                                        cardBody(
                                            'Project date', '01 March, 2020'),
                                        cardBody(
                                            'Project URL', 'www.example.com',
                                            hasLink: true)
                                      ],
                                    ),
                                  ),
                                  const Text(
                                    'This is an example of portfolio detail',
                                    style: TextStyle(
                                        fontFamily: Fonts.raleway,
                                        fontSize: 26,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF444444)),
                                  ).container(
                                      padding: const EdgeInsets.only(top: 30)),
                                  const Text(
                                    'Autem ipsum nam porro corporis rerum. Quis eos dolorem eos itaque inventore commodi labore quia quia. Exercitationem repudiandae officiis neque suscipit non officia eaque itaque enim. Voluptatem officia accusantium nesciunt est omnis tempora consectetur dignissimos. Sequi nulla at esse enim cum deserunt eius.',
                                    style: TextStyle(
                                        fontFamily: Fonts.openSans,
                                        fontSize: 14,
                                        color: Color(0xFF444444)),
                                  ).container(
                                      padding: const EdgeInsets.only(top: 20))
                                ],
                              ))
                        ],
                      ),
                    ),
                    const FooterSection()
                  ]),
            ),
          ),
        ],
      ),
    ).safeArea(top: context.isMobile);
  }

  Widget cardBody(String title, String content, {bool hasLink = false}) {
    final TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();
    tapGestureRecognizer.onTap = () {};
    return Text.rich(TextSpan(
        text: '$title: ',
        style: const TextStyle(
            fontFamily: Fonts.openSans,
            fontSize: 15,
            color: Color(0xFF444444),
            fontWeight: FontWeight.bold),
        children: <InlineSpan>[
          TextSpan(
            text: content,
            recognizer: hasLink ? tapGestureRecognizer : null,
            style: TextStyle(
                fontFamily: Fonts.openSans,
                fontSize: 15,
                color: hasLink ? context.primaryColor : const Color(0xFF444444),
                fontWeight: FontWeight.w400),
          )
        ])).container(padding: const EdgeInsets.only(top: 10));
  }
}
