import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';

import '../app/colors.dart';
import '../app/data.dart';
import '../app/fonts.dart';
import '../app/text_styles.dart';
import '../models/portfolio_model.dart';
import '../widgets/portfolio_item.dart';

class PortfolioSection extends StatefulWidget {
  const PortfolioSection({super.key});

  @override
  State<PortfolioSection> createState() => _PortfolioSectionState();
}

class _PortfolioSectionState extends State<PortfolioSection>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  List<String> tabs = <String>['All', 'App', 'Card', 'Web'];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'PORTFOLIO',
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
        Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                    tabs.length,
                    (int index) => HoverableWidget(
                          hoverBuilder:
                              (BuildContext context, bool isTabHovered) => Text(
                            tabs[index].toUpperCase(),
                            style: TextStyle(
                                fontFamily: Fonts.openSans,
                                color: (index == selectedIndex || isTabHovered)
                                    ? context.primaryColor
                                    : textPrimaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          )
                                  .container(
                                      padding: const EdgeInsets.fromLTRB(
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
                        )))
            .fadeIn(initialPosition: 80, variant: NextFadeInVariant.fadeInTop),
        NextGridView(
                widthPercentages: const <GridPrefix, double>{
              GridPrefix.xs: 100,
              GridPrefix.sm: 100,
              GridPrefix.md: 50,
              GridPrefix.lg: 33.33,
              GridPrefix.xl: 33.33,
              GridPrefix.xxl: 33.33
            },
                children: portfolioItems
                    .where((PortfolioModel e) =>
                        e.type == tabs.elementAt(selectedIndex) ||
                        selectedIndex == 0)
                    .map((PortfolioModel e) => PortfolioItem(
                          portfolioItem: e,
                          shouldDisplay: true,
                        ))
                    .toList())
            .fadeIn(variant: NextFadeInVariant.fadeInTop)
      ]).container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60)),
    );
  }
}
