import 'package:bootstrap/widgets/responsive_grid.dart';
import 'package:flutter/material.dart';

import '../app/colors.dart';
import '../app/data.dart';
import '../app/fonts.dart';
import '../app/text_styles.dart';
import '../extensions/extensions.dart';
import '../models/portfolio_model.dart';
import '../widgets/hover_widget.dart';
import '../widgets/portfolio_item.dart';

class PortfolioSection extends StatefulWidget {
  const PortfolioSection({Key? key}) : super(key: key);

  @override
  State<PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  List<String> tabs = ['All', 'App', 'Card', 'Web'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          'PORTFOLIO',
          style: SectionTitle.h2(context),
          textAlign: TextAlign.center,
        ),
        Text(
          'Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem.',
          style: SectionTitle.p(context),
          textAlign: TextAlign.center,
        ).container(const EdgeInsets.only(top: 10, bottom: 20)),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                tabs.length,
                (int index) => HoverWidget(
                      builder: (BuildContext context, bool isTabHovered) =>
                          Text(
                        tabs[index].toUpperCase(),
                        style: TextStyle(
                            fontFamily: Fonts.openSans,
                            color: (index == selectedIndex || isTabHovered)
                                ? context.primaryColor
                                : textPrimaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      )
                              .container(const EdgeInsets.fromLTRB(
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
        ResponsiveGrid(
            sizes: 'col-12 col-lg-4 col-md-6',
            // horizontalSpacing: 20,
            // verticalSpacing: 20,
            childrens: portfolioItems
                .map((PortfolioModel e) =>
                    (e.type == tabs.elementAt(selectedIndex) ||
                            selectedIndex == 0)
                        ? PortfolioItem(
                            portfolioItem: e,
                            shouldDisplay: true,
                          )
                        : const SizedBox())
                .toList())
      ]).container(const EdgeInsets.symmetric(horizontal: 20, vertical: 60)),
    );
  }
}
