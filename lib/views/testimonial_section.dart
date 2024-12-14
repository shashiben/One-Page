import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';

import '../app/data.dart';
import '../app/text_styles.dart';
import '../models/testimonial_model.dart';
import '../widgets/testimonial_item.dart';

class TestimonialSection extends StatefulWidget {
  const TestimonialSection({super.key});

  @override
  State<TestimonialSection> createState() => _TestimonialSectionState();
}

class _TestimonialSectionState extends State<TestimonialSection> {
  int currentIndex = 0;
  late CarouselSliderController pageController;
  @override
  void initState() {
    super.initState();
    pageController = CarouselSliderController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'TESTIMONIALS',
                style: SectionTitle.h2(context),
                textAlign: TextAlign.center,
              ),
              Text(
                'Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem.',
                style: SectionTitle.p(context),
                textAlign: TextAlign.center,
              ).container(padding: const EdgeInsets.only(top: 10, bottom: 20)),
            ],
          ).fadeIn(
            variant: NextFadeInVariant.fadeInTop,
            initialPosition: 80,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: <PointerDeviceKind>{
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: CarouselSlider(
                  carouselController: pageController,
                  options: CarouselOptions(
                      height: 420,
                      viewportFraction: context.isMobile
                          ? 1
                          : context.isMd
                              ? 1 / 2
                              : 1 / 3,
                      autoPlay: true,
                      onPageChanged:
                          (int index, CarouselPageChangedReason reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      }),
                  items: reviewsList
                      .map((TestimonialModel e) => TestimonialItem(review: e)
                          .sizedBox(width: 395, height: 420))
                      .toList(),
                ),
              ).container(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          context.isMobile ? 20 : context.width * 0.05)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      reviewsList.length,
                      (int index) => AnimatedContainer(
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  height: 15,
                                  width: 15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: index == currentIndex
                                        ? context.primaryColor
                                        : context.primaryColor
                                            .withValues(alpha: .4),
                                  ),
                                  duration: const Duration(milliseconds: 300))
                              .onTap(() {
                            pageController.animateToPage(index);
                          })))
            ],
          ).fadeIn(
            variant: NextFadeInVariant.fadeInTop,
          ),
        ],
      ).container(padding: const EdgeInsets.symmetric(vertical: 60)),
    );
  }
}
