import 'package:bootstrap/app/colors.dart';
import 'package:bootstrap/app/data.dart';
import 'package:bootstrap/bootstrap_col.dart';
import 'package:bootstrap/bootstrap_row.dart';
import 'package:bootstrap/widgets/hover_widget.dart';
import 'package:bootstrap/widgets/portfolio_item.dart';
import 'package:flutter/material.dart';
import 'package:bootstrap/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app/text_styles.dart';

class PortfolioSection extends StatefulWidget {
  const PortfolioSection({Key? key}) : super(key: key);

  @override
  State<PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  List<String> tabs = ["All", "App", "Card", "Web"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          "PORTFOLIO",
          style: SectionTitle.h2(context),
          textAlign: TextAlign.center,
        ),
        Text(
          "Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem.",
          style: SectionTitle.p(context),
          textAlign: TextAlign.center,
        ).padding(const EdgeInsets.only(top: 10, bottom: 20)),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: List.generate(
                tabs.length,
                (index) => HoverWidget(
                      child: (context, isTabHovered) => Text(
                        tabs[index].toUpperCase(),
                        style: GoogleFonts.openSans(
                            color: (index == selectedIndex || isTabHovered)
                                ? primaryColor
                                : textPrimaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      )
                          .padding(const EdgeInsets.fromLTRB(
                        10,
                        15,
                        8,
                        15,
                      ))
                          .onTap(() {
                        setState(() {
                          selectedIndex = index;
                        });
                      }),
                    ))),
        BootstrapRow(
            horizontalSpacing: 20,
            verticalSpacing: 20,
            children: portfolioItems
                .map((e) => (e.type == tabs.elementAt(selectedIndex) ||
                        selectedIndex == 0)
                    ? BootstrapCol(
                        sizes: "col-12 col-lg-4 col-md-6",
                        child: PortfolioItem(
                          portfolioItem: e,
                          shouldDisplay: true,
                        ))
                    : BootstrapCol(
                        sizes: "col-0 col-sm-0", child: const SizedBox()))
                .toList())
      ]).padding(const EdgeInsets.symmetric(horizontal: 20, vertical: 60)),
    );
  }
}
