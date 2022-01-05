import 'package:bootstrap/bootstrap_button.dart';
import 'package:bootstrap/widgets/hover_widget.dart';
import 'package:bootstrap/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bootstrap/extensions.dart';

import '../app/colors.dart';

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
        ...titles.map((e) => HoverWidget(child: (context, isHovered) {
              return Text(e,
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          color: isHovered
                              ? primaryColor
                              : const Color(0xFF16507B)))
                  .padding(const EdgeInsets.symmetric(vertical: 10)
                      .copyWith(left: 30))
                  .onTap(() {
                if (keyList[e] != null && keyList[e]?.currentContext != null) {
                  Scrollable.ensureVisible(keyList[e]!.currentContext!,
                      duration: const Duration(milliseconds: 300));
                } else {}
              });
            })),
        BootstrapButton(
            color: primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            margin: const EdgeInsets.only(left: 30),
            onPressed: () {},
            child: (isHovered) => Text(
                  "Get started",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )),
      ],
      leading: Text(
        "OnePage",
        style:
            GoogleFonts.poppins(fontSize: 28, color: const Color(0xFF16507B)),
      ).onTap(() {
        GoRouter.of(context).push('/');
      }),
    );
  }
}
