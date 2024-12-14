import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app/colors.dart';
import '../app/fonts.dart';
import '../models/service_model.dart';

class ServiceItem extends StatefulWidget {
  const ServiceItem({super.key, required this.serviceModel});
  final ServiceModel serviceModel;

  @override
  State<ServiceItem> createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return HoverableWidget(
      hoverBuilder: (BuildContext context, bool isHovered) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: <BoxShadow>[
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
          children: <Widget>[
            SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                children: <Widget>[
                  Align(
                    child: SvgPicture.string(
                      widget.serviceModel.background,
                      height: 100,
                      width: 100,
                      colorFilter: isHovered
                          ? ColorFilter.mode(
                              widget.serviceModel.color, BlendMode.srcIn)
                          : null,
                    ),
                  ),
                  Align(
                    child: Icon(
                      widget.serviceModel.icon,
                      size: 30,
                      color:
                          isHovered ? Colors.white : widget.serviceModel.color,
                    ),
                  )
                ],
              ),
            ),
            Text(
              widget.serviceModel.title,
              style: const TextStyle(
                  fontFamily: Fonts.raleway,
                  color: textPrimaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 22),
              textAlign: TextAlign.center,
            ).container(padding: const EdgeInsets.only(top: 10, bottom: 15)),
            Text(
              widget.serviceModel.description,
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

  @override
  bool get wantKeepAlive => true;
}
