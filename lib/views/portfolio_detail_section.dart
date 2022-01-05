import 'package:bootstrap/bootstrap_col.dart';
import 'package:bootstrap/bootstrap_row.dart';
import 'package:bootstrap/views/footer_section.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bootstrap/extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app/colors.dart';
import 'header_section.dart';

class PortfolioDetailSection extends StatefulWidget {
  const PortfolioDetailSection({Key? key}) : super(key: key);

  @override
  _PortfolioDetailSectionState createState() => _PortfolioDetailSectionState();
}

class _PortfolioDetailSectionState extends State<PortfolioDetailSection> {
  int currentIndex = 0;
  late CarouselController pageController;
  @override
  void initState() {
    super.initState();
    pageController = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderSection(
            titles: [],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      color: const Color(0xFFF8FBFE),
                      padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal:
                              context.isMobile ? 20 : context.width * 0.05),
                      child: BootstrapRow(verticalSpacing: 20, children: [
                        BootstrapCol(
                            sizes: "col-12 col-lg-6",
                            child: Text("Portfolio Details",
                                style: GoogleFonts.raleway(
                                    color: const Color(0xFF444444),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w300))),
                        BootstrapCol(
                            sizes: "col-12 col-lg-6",
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: context.width > 992
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Text.rich(TextSpan(
                                    text: "Home   ",
                                    style: GoogleFonts.openSans(
                                        fontSize: 14, color: primaryColor),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        GoRouter.of(context).pop(context);
                                      },
                                    children: [
                                      TextSpan(
                                        text: "/   ",
                                        style: GoogleFonts.openSans(
                                            fontSize: 14,
                                            color: const Color(0xff444444)),
                                      ),
                                      TextSpan(
                                        text: "Portfolio Details",
                                        style: GoogleFonts.openSans(
                                            fontSize: 14,
                                            color: const Color(0xff444444)),
                                      )
                                    ]))
                              ],
                            ))
                      ]),
                      width: context.width,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              context.isMobile ? 20 : context.width * 0.05),
                      margin: const EdgeInsets.only(top: 40, bottom: 80),
                      child: BootstrapRow(
                        verticalAlignment: MainAxisAlignment.start,
                        horizontalAlignment: CrossAxisAlignment.start,
                        gridHorizontalAlignment: MainAxisAlignment.start,
                        gridVerticalAlignment: CrossAxisAlignment.start,
                        children: [
                          BootstrapCol(
                            sizes: "col-12 col-lg-8",
                            child: Column(
                              children: [
                                SizedBox(
                                    height: context.height,
                                    width: context.width,
                                    child: ScrollConfiguration(
                                      behavior: ScrollConfiguration.of(context)
                                          .copyWith(
                                        dragDevices: {
                                          PointerDeviceKind.touch,
                                          PointerDeviceKind.mouse,
                                        },
                                      ),
                                      child: CarouselSlider(
                                        carouselController: pageController,
                                        options: CarouselOptions(
                                            onPageChanged: (index, reason) {
                                              setState(() {
                                                currentIndex = index;
                                              });
                                            },
                                            enableInfiniteScroll: true,
                                            viewportFraction: 1),
                                        items: List.generate(
                                            3,
                                            (index) => Image.asset(
                                                  "assets/portfolio/portfolio-${index + 1}.jpg",
                                                  fit: BoxFit.fitWidth,
                                                )),
                                      ),
                                    )),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        3,
                                        (index) => AnimatedContainer(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: index == currentIndex
                                                    ? primaryColor
                                                    : primaryColor
                                                        .withOpacity(0.4)),
                                            duration: const Duration(
                                                milliseconds: 300)))).padding(
                                    const EdgeInsets.symmetric(vertical: 40))
                              ],
                            ),
                          ),
                          BootstrapCol(
                              sizes: "col-12 col-lg-4",
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(30),
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Project Information",
                                          style: GoogleFonts.raleway(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w700),
                                        ).padding(
                                            const EdgeInsets.only(bottom: 20)),
                                        const Divider().padding(
                                            const EdgeInsets.only(bottom: 10)),
                                        cardBody("Category", "Web design"),
                                        cardBody("Client", "ASU Company"),
                                        cardBody(
                                            "Project date", "01 March, 2020"),
                                        cardBody(
                                            "Project URL", "www.example.com",
                                            hasLink: true)
                                      ],
                                    ),
                                  ),
                                  Text(
                                    "This is an example of portfolio detail",
                                    style: GoogleFonts.raleway(
                                        fontSize: 26,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF444444)),
                                  ).padding(const EdgeInsets.only(top: 30)),
                                  Text(
                                    "Autem ipsum nam porro corporis rerum. Quis eos dolorem eos itaque inventore commodi labore quia quia. Exercitationem repudiandae officiis neque suscipit non officia eaque itaque enim. Voluptatem officia accusantium nesciunt est omnis tempora consectetur dignissimos. Sequi nulla at esse enim cum deserunt eius.",
                                    style: GoogleFonts.openSans(
                                        fontSize: 14,
                                        color: const Color(0xFF444444)),
                                  ).padding(const EdgeInsets.only(top: 20))
                                ],
                              ))
                        ],
                        verticalSpacing: 20,
                        horizontalSpacing: 20,
                      ),
                    ),
                    const FooterSection()
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardBody(String title, String content, {bool hasLink = false}) {
    TapGestureRecognizer tapGestureRecognizer = TapGestureRecognizer();
    tapGestureRecognizer.onTap = () {};
    return Text.rich(TextSpan(
        text: "$title: ",
        style: GoogleFonts.openSans(
            fontSize: 15,
            color: const Color(0xFF444444),
            fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: content,
            recognizer: hasLink ? tapGestureRecognizer : null,
            style: GoogleFonts.openSans(
                fontSize: 15,
                color: hasLink ? primaryColor : const Color(0xFF444444),
                fontWeight: FontWeight.w400),
          )
        ])).padding(const EdgeInsets.only(top: 10));
  }
}
