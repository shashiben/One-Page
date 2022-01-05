import 'package:bootstrap/app/colors.dart';
import 'package:bootstrap/widgets/hover_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bootstrap/extensions.dart';

class FooterItem extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const FooterItem({Key? key, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      child: (context, isHovered) => Row(
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
              style: GoogleFonts.openSans(
                  fontSize: 14,
                  color: isHovered ? primaryColor : const Color(0xFF444444)),
            ),
          ),
        ],
      ).padding(const EdgeInsets.symmetric(vertical:8)),
    );
  }
}
