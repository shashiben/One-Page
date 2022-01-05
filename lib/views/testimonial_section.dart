import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:bootstrap/app/data.dart';
import 'package:bootstrap/extensions.dart';
import 'package:bootstrap/widgets/testimonial_item.dart';

import '../app/colors.dart';
import '../app/text_styles.dart';

class TestimonialSection extends StatefulWidget {
  const TestimonialSection({Key? key}) : super(key: key);

  @override
  State<TestimonialSection> createState() => _TestimonialSectionState();
}

class _TestimonialSectionState extends State<TestimonialSection> {
  int currentIndex = 0;
  late CarouselController pageController;
  @override
  void initState() {
    super.initState();
    pageController = CarouselController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "TESTIMONIALS",
            style: SectionTitle.h2(context),
            textAlign: TextAlign.center,
          ),
          Text(
            "Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem.",
            style: SectionTitle.p(context),
            textAlign: TextAlign.center,
          ).padding(const EdgeInsets.only(top: 10, bottom: 20)),
          SizedBox(
              height: context.height * 0.8,
              width: context.width,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
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
                      viewportFraction: (400 / context.width) > 1
                          ? 1
                          : (400 / context.width)),
                  items: reviewsList
                      .map((e) => TestimonialItem(review: e))
                      .toList(),
                ),
              )),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: List.generate(
                  reviewsList.length,
                  (index) => AnimatedContainer(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == currentIndex
                              ? primaryColor
                              : primaryColor.withOpacity(0.4)),
                      duration: const Duration(milliseconds: 300))))
        ],
      ).padding(const EdgeInsets.symmetric(vertical: 60)),
    );
  }
}
