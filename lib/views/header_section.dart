import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:go_router/go_router.dart';

import '../app/fonts.dart';
import '../widgets/navigation_drawer.dart' as cnd;

class HeaderSection extends StatelessWidget {
  const HeaderSection(
      {super.key,
      this.scrollController,
      this.keyList = const <String, GlobalKey<State<StatefulWidget>>>{},
      required this.titles});
  final ScrollController? scrollController;
  final List<String> titles;
  final Map<String, GlobalKey> keyList;

  @override
  Widget build(BuildContext context) {
    return cnd.NavigationDrawer(
      padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: context.isMobile ? 20 : context.width * 0.05),
      scrollController: scrollController,
      color: Colors.white,
      childrens: <Widget>[
        ...titles.map((String e) => HoverableWidget(
                hoverBuilder: (BuildContext context, bool isHovered) {
              return Text(e,
                      style: TextStyle(
                          fontFamily: Fonts.openSans,
                          fontSize: 14,
                          color: isHovered
                              ? context.primaryColor
                              : const Color(0xFF16507B)))
                  .container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      margin: const EdgeInsets.only(left: 30))
                  .onTap(() {
                if (keyList[e] != null && keyList[e]?.currentContext != null) {
                  Scrollable.ensureVisible(keyList[e]!.currentContext!,
                      duration: const Duration(milliseconds: 300));
                  if (context.width <= 992) {
                    Navigator.pop(context);
                  }
                } else {}
              });
            })),
        NextButton(
          borderRadius: BorderRadius.circular(4),
          color: context.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          margin: const EdgeInsets.only(left: 30),
          onPressed: () {
            Scrollable.ensureVisible(keyList['Home']?.currentContext ?? context,
                duration: const Duration(milliseconds: 800),
                curve: Curves.linear);
          },
          style: const TextStyle(
              fontFamily: Fonts.poppins,
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w300),
          child: const Text('Get started'),
        ),
      ],
      leading: const Text(
        'OnePage',
        style: TextStyle(
            fontFamily: Fonts.poppins, fontSize: 28, color: Color(0xFF16507B)),
      ).onTap(() {
        context.go('/');
      }),
    );
  }
}
