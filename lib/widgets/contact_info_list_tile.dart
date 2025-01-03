import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';

import '../app/fonts.dart';

class ContactListTile extends StatelessWidget {
  const ContactListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.leadingIcon});
  final String title, subtitle;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(
      hoverBuilder: (BuildContext context, bool isHovered) => Row(
        children: <Widget>[
          AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                  color: isHovered
                      ? const Color(0xFF2487ce)
                      : context.primaryColor.withValues(alpha: .2),
                  borderRadius: BorderRadius.circular(5)),
              padding: const EdgeInsets.all(8),
              child: Icon(
                leadingIcon,
                size: 20,
                color: isHovered ? Colors.white : context.primaryColor,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                    fontFamily: Fonts.raleway,
                    fontSize: 22,
                    color: Color(0xFF124265),
                    fontWeight: FontWeight.w600),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                    fontFamily: Fonts.openSans,
                    color: Color(0xFF217bbc),
                    fontWeight: FontWeight.w400),
              )
            ],
          ).container(padding: const EdgeInsets.only(left: 15)),
        ],
      ),
    ).container(padding: const EdgeInsets.only(bottom: 40));
  }
}
