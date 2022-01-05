import 'package:bootstrap/app/colors.dart';
import 'package:bootstrap/models/service_model.dart';
import 'package:bootstrap/widgets/hover_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bootstrap/extensions.dart';

class ServiceItem extends StatelessWidget {
  final ServiceModel serviceModel;
  const ServiceItem({Key? key, required this.serviceModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverWidget(
      child: (context, isHovered) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(18, 66, 101, 0.08),
              blurRadius: 15,
              spreadRadius: isHovered ? 10 : 5,
              offset: Offset(
                2.0,
                isHovered ? 6.0 : 2.0,
              ),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.string(
                      serviceModel.background,
                      height: 100,
                      width: 100,
                      color: isHovered ? serviceModel.color : null,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
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
              style: GoogleFonts.raleway(
                  color: textPrimaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
              textAlign: TextAlign.center,
            ).padding(const EdgeInsets.only(top: 10, bottom: 15)),
            Text(
              serviceModel.description,
              style: GoogleFonts.openSans(
                  color: textPrimaryColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 14),
              textAlign: TextAlign.center,
            )
          ],
        ).padding(const EdgeInsets.symmetric(horizontal: 20, vertical: 60)),
      ),
    );
  }
}
