import 'package:flutter/material.dart';

import '../app/colors.dart';
import '../app/fonts.dart';
import '../extensions.dart';
import 'hover_widget.dart';

class FooterItem extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const FooterItem({Key? key, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      child: (BuildContext context, bool isHovered) => Row(
        children: [
          const Icon(
            Icons.arrow_forward_ios,
            color: primaryColor,
            size: 14,
          ).padding(const EdgeInsets.only(right: 10)),
          InkWell(
            onTap: () {},
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: Fonts.openSans,
                  fontSize: 14,
                  color: isHovered ? primaryColor : const Color(0xFF444444)),
            ),
          ),
        ],
      ).padding(const EdgeInsets.symmetric(vertical: 8)),
    );
  }
}
