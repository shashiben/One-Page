import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:line_icons/line_icons.dart';

import '../app/fonts.dart';
import '../models/team_model.dart';

class TeamItem extends StatelessWidget {
  const TeamItem({super.key, required this.member});
  final TeamModel member;

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(
      hoverBuilder: (BuildContext context, bool isHovered) => Container(
        width: context.width,
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color.fromRGBO(18, 66, 101, 0.08),
            blurRadius: 15,
            spreadRadius: isHovered ? 10 : 5,
            offset: Offset(
              2.0,
              isHovered ? 6.0 : 2.0,
            ),
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(6)),
        child: Column(children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                member.image,
                fit: BoxFit.fitHeight,
                width: context.width,
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: isHovered ? 1 : 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: .8)),
                    width: double.infinity,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <IconData>[
                          LineIcons.twitter,
                          LineIcons.facebook,
                          LineIcons.instagram,
                          LineIcons.linkedin
                        ]
                            .map((IconData e) => HoverableWidget(
                                  hoverBuilder: (BuildContext context,
                                          bool isIconHovered) =>
                                      Icon(
                                    e,
                                    size: 20,
                                    color: isIconHovered
                                        ? context.primaryColor
                                        : const Color(0xFF124265),
                                  ),
                                ))
                            .toList()),
                  ),
                ),
              )
            ],
          ).clipRRect(topLeft: 6, topRight: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Column(
              children: <Widget>[
                Text(
                  member.name,
                  style: const TextStyle(
                      fontFamily: Fonts.raleway,
                      fontSize: 18,
                      color: Color(0xFF124265),
                      fontWeight: FontWeight.w700),
                ).container(padding: const EdgeInsets.only(bottom: 5)),
                Text(
                  member.role,
                  style: const TextStyle(
                      fontFamily: Fonts.openSans,
                      fontSize: 13,
                      color: Color(0xFFAAAAAA)),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
