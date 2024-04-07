import 'package:flutter_svg/flutter_svg.dart';

import '../app/colors.dart';
import '../app/fonts.dart';
import '../models/service_model.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final ServiceModel serviceModel;
  const ServiceItem({super.key, required this.serviceModel});

  @override
  Widget build(BuildContext context) {
    return HoverableWidget(
      hoverBuilder: (BuildContext context, bool isHovered) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(18, 66, 101, 0.08),
              blurRadius: 15,
              spreadRadius: isHovered ? 10 : 2,
              offset: Offset(
                isHovered ? 2 : 0,
                isHovered ? 6.0 : 2.0,
              ),
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                children: [
                  Align(
                    child: SvgPicture.string(
                      serviceModel.background,
                      height: 100,
                      width: 100,
                      colorFilter: isHovered
                          ? ColorFilter.mode(
                              serviceModel.color, BlendMode.srcIn)
                          : null,
                    ),
                  ),
                  Align(
                    child: Icon(
                      serviceModel.icon,
                      size: 30,
                      color: isHovered ? Colors.white : serviceModel.color,
                    ),
                  )
                ],
              ),
            ),
            Text(
              serviceModel.title,
              style: const TextStyle(
                  fontFamily: Fonts.raleway,
                  color: textPrimaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
              textAlign: TextAlign.center,
            ).container(padding: const EdgeInsets.only(top: 10, bottom: 15)),
            Text(
              serviceModel.description,
              style: const TextStyle(
                  fontFamily: Fonts.openSans,
                  color: textPrimaryColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 14),
              textAlign: TextAlign.center,
            )
          ],
        ).container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60)),
      ),
    );
  }
}
