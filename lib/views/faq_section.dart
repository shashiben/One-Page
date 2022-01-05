import 'dart:math';

import 'package:bootstrap/app/colors.dart';
import 'package:bootstrap/app/data.dart';
import 'package:bootstrap/app/text_styles.dart';
import 'package:bootstrap/widgets/accordion.dart';
import 'package:bootstrap/widgets/hover_widget.dart';
import 'package:flutter/material.dart';
import 'package:bootstrap/extensions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 60,
          horizontal: context.isMobile ? 20 : context.width * 0.05),
      color: const Color.fromRGBO(248, 251, 254, 1),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "FREQUENTLY ASKED QUESTIONS",
            textAlign: TextAlign.center,
            style: SectionTitle.h2(context),
          ).padding(const EdgeInsets.only(bottom: 20)),
          SizedBox(
            width: context.isMobile ? context.width - 40 : context.width * 0.8,
            child: Text(
              "Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem hic quas.",
              style: SectionTitle.p(context),
              textAlign: TextAlign.center,
            ).padding(const EdgeInsets.only(bottom: 30)),
          ),
          ...faqList.entries
              .map((e) => HoverWidget(
                    child: (context, isHovered) => Accordion(
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
                      trailing: (isExpanded) => Transform.rotate(
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
                        style: GoogleFonts.poppins(
                            color: isHovered
                                ? const Color(0xFF2487ce)
                                : textPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                      children: [
                        Text(
                          e.value,
                          textAlign: TextAlign.start,
                        ).padding(const EdgeInsets.only(top: 10))
                      ],
                      initiallyExpanded:
                          faqList.keys.toList().indexOf(e.key) == 0,
                    ),
                  ).padding(const EdgeInsets.only(top: 20)))
              .toList()
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
