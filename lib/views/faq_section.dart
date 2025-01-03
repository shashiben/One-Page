import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:line_icons/line_icons.dart';

import '../app/colors.dart';
import '../app/data.dart';
import '../app/fonts.dart';
import '../app/text_styles.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 60,
          horizontal: context.isMobile ? 20 : context.width * 0.05),
      color: const Color.fromRGBO(248, 251, 254, 1),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'FREQUENTLY ASKED QUESTIONS',
                textAlign: TextAlign.center,
                style: SectionTitle.h2(context),
              ).container(padding: const EdgeInsets.only(bottom: 20)),
              SizedBox(
                width:
                    context.isMobile ? context.width - 40 : context.width * 0.8,
                child: Text(
                  'Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.',
                  style: SectionTitle.p(context),
                  textAlign: TextAlign.center,
                ).container(padding: const EdgeInsets.only(bottom: 30)),
              ),
            ],
          ).fadeIn(
              variant: NextFadeInVariant.fadeInTop,
              initialPosition: 50,
              duration: const Duration(milliseconds: 300)),
          Column(
            children: <Widget>[
              ...faqList.entries
                  .map((MapEntry<String, String> e) => HoverableWidget(
                        hoverBuilder: (BuildContext context, bool isHovered) =>
                            NextAccordion(
                          horizontalTitleGap: context.isMobile ? 5 : 10,
                          collapsedBackgroundColor: Colors.white,
                          backgroundColor: Colors.white,
                          leading: const Icon(
                            LineIcons.questionCircle,
                            size: 24,
                            color: Color(0xFF87c1ea),
                          ),
                          borderColor: Colors.white,
                          childrenPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ).copyWith(bottom: 15),
                          trailing: (bool isExpanded) => Transform.rotate(
                            angle: isExpanded ? -pi : 0,
                            child: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: (isExpanded || isHovered)
                                  ? const Color(0xFF2487ce)
                                  : textPrimaryColor,
                            ),
                          ),
                          title: Text(
                            e.key,
                            style: TextStyle(
                                fontFamily: Fonts.poppins,
                                color: isHovered
                                    ? const Color(0xFF2487ce)
                                    : textPrimaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start,
                          ),
                          initiallyExpanded:
                              faqList.keys.toList().indexOf(e.key) == 0,
                          children: <Widget>[
                            Text(
                              e.value,
                              textAlign: TextAlign.start,
                            ).container(padding: const EdgeInsets.only(top: 10))
                          ],
                        ),
                      ).container(padding: const EdgeInsets.only(top: 20)))
            ],
          ).fadeIn(variant: NextFadeInVariant.fadeInTop),
        ],
      ),
    );
  }
}
