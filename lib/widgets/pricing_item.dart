import 'package:bootstrap/app/colors.dart';
import 'package:bootstrap/models/pricing_model.dart';
import 'package:bootstrap/widgets/hover_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bootstrap_button.dart';
import 'package:bootstrap/extensions.dart';

class PricingItem extends StatelessWidget {
  final PricingModel pricingModel;
  final bool isActive;
  final int index;
  const PricingItem(
      {Key? key,
      required this.pricingModel,
      this.isActive = false,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isActive ? context.themeData.primaryColor : Colors.white;
    final borderColor =
        isActive ? Colors.white : context.themeData.primaryColor;
    return HoverWidget(
      child: (context, isItemHovered) => Container(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(18, 66, 101, 0.08),
                blurRadius: 10,
                spreadRadius: isItemHovered ? 10 : 2,
                offset: Offset(
                  1.0,
                  isItemHovered ? 6.0 : 1.0,
                ),
              ),
            ],
            color: backgroundColor,
          ),
          child: Column(
            children: [
              Text(
                pricingModel.name,
                style: GoogleFonts.raleway(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: isActive ? Colors.white : textPrimaryColor),
              ).padding(const EdgeInsets.all(15).copyWith(top: 25)),
              Text.rich(TextSpan(
                  text: "\$",
                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: isActive ? Colors.white : textPrimaryColor),
                  children: [
                    TextSpan(
                      text: "${pricingModel.price}",
                      style: GoogleFonts.openSans(
                          fontSize: 42,
                          fontWeight: FontWeight.w600,
                          color: isActive ? Colors.white : textPrimaryColor),
                    ),
                    TextSpan(
                      text: "/month",
                      style: GoogleFonts.raleway(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: isActive
                              ? Colors.white
                              : const Color(0xFFbababa)),
                    ),
                  ])).padding(const EdgeInsets.only(bottom: 20)),
              ...pricingModel.included.map((e) => Text(
                    e,
                    style: GoogleFonts.openSans(
                        fontSize: 14,
                        color: isActive ? Colors.white : textPrimaryColor),
                  ).padding(const EdgeInsets.only(bottom: 16))),
              ...pricingModel.notIncluded.map((e) => Text(
                    e,
                    style: GoogleFonts.openSans(
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color:
                            !isActive ? const Color(0xFFbababa) : Colors.white),
                  ).padding(const EdgeInsets.only(bottom: 16))),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: BootstrapButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 14),
                    color: !isActive
                        ? context.themeData.primaryColor
                        : Colors.white,
                    outlineColor: isActive
                        ? context.themeData.primaryColor
                        : Colors.white,
                    variant: ButtonVariant.outlined,
                    child: ((isHovered) => Text(
                          "Buy now",
                          style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              color: isActive
                                  ? (!isHovered ? borderColor : backgroundColor)
                                  : !isHovered
                                      ? context.themeData.primaryColor
                                      : Colors.white),
                        )),
                    onPressed: () {}),
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
