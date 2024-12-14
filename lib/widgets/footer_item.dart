import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';

import '../app/fonts.dart';

class FooterItem extends StatelessWidget {
  const FooterItem({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(
      hoverBuilder: (BuildContext context, bool isHovered) => Row(
        children: <Widget>[
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
