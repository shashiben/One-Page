import 'package:flutter_next/flutter_next.dart';
import 'package:flutter/material.dart';

import '../app/fonts.dart';

class FooterItem extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const FooterItem({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(
      hoverBuilder: (BuildContext context, bool isHovered) => Row(
        children: [
          Icon(
            Icons.arrow_forward_ios,
            color: context.primaryColor,
            size: 14,
          ).container(padding: const EdgeInsets.only(right: 10)),
          InkWell(
            onTap: () {},
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: Fonts.openSans,
                  fontSize: 14,
                  color: isHovered
                      ? context.primaryColor
                      : const Color(0xFF444444)),
            ),
          ),
        ],
      ).container(padding: const EdgeInsets.symmetric(vertical: 8)),
    );
  }
}
