import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app/colors.dart';
import '../app/fonts.dart';
import '../bootstrap_button.dart';
import '../extensions.dart';
import '../widgets/hover_widget.dart';
import '../widgets/navigation_drawer.dart';

class HeaderSection extends StatelessWidget {
  final ScrollController? scrollController;
  final List<String> titles;
  final Map<String, GlobalKey> keyList;
  const HeaderSection(
      {Key? key,
      this.scrollController,
      this.keyList = const {},
      required this.titles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: context.isMobile ? 20 : context.width * 0.05),
      scrollController: scrollController,
      color: Colors.white,
      childrens: [
        ...titles.map((String e) => HoverWidget(child: (BuildContext context, bool isHovered) {
              return Text(e,
                      style: TextStyle(
                          fontFamily: Fonts.openSans,
                          fontSize: 14,
                          color: isHovered
                              ? primaryColor
                              : const Color(0xFF16507B)))
                  .padding(const EdgeInsets.symmetric(vertical: 10),
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
        BootstrapButton(
            color: primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            margin: const EdgeInsets.only(left: 30),
            onPressed: () {},
            child: (bool isHovered) => const Text(
                  'Get started',
                  style: TextStyle(
                      fontFamily: Fonts.poppins,
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )),
      ],
      leading: const Text(
        'OnePage',
        style: TextStyle(
            fontFamily: Fonts.poppins,
            fontSize: 28,
            color: Color(0xFF16507B)),
      ).onTap(() {
        GoRouter.of(context).push('/');
      }),
    );
  }
}
