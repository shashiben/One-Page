import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';

import '../app/colors.dart';
import '../app/fonts.dart';
import '../models/pricing_model.dart';

class PricingItem extends StatelessWidget {
  const PricingItem(
      {super.key,
      required this.pricingModel,
      this.isActive = false,
      required this.index});
  final PricingModel pricingModel;
  final bool isActive;
  final int index;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        isActive ? context.primaryColor : Colors.white;
    return HoverableWidget(
      hoverBuilder: (BuildContext context, bool isItemHovered) => Container(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: <BoxShadow>[
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
            children: <Widget>[
              Text(
                pricingModel.name,
                style: TextStyle(
                    fontFamily: Fonts.raleway,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: isActive ? Colors.white : textPrimaryColor),
              ).container(padding: const EdgeInsets.all(15).copyWith(top: 25)),
              Text.rich(TextSpan(
                  text: r'$',
                  style: TextStyle(
                      fontFamily: Fonts.openSans,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: isActive ? Colors.white : textPrimaryColor),
                  children: <InlineSpan>[
                    TextSpan(
                      text: '${pricingModel.price}',
                      style: TextStyle(
                          fontFamily: Fonts.openSans,
                          fontSize: 42,
                          fontWeight: FontWeight.w600,
                          color: isActive ? Colors.white : textPrimaryColor),
                    ),
                    TextSpan(
                      text: '/month',
                      style: TextStyle(
                          fontFamily: Fonts.raleway,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: isActive
                              ? Colors.white
                              : const Color(0xFFbababa)),
                    ),
                  ])).container(padding: const EdgeInsets.only(bottom: 20)),
              ...pricingModel.included.map((String e) => Text(
                    e,
                    style: TextStyle(
                        fontFamily: Fonts.openSans,
                        fontSize: 14,
                        color: isActive ? Colors.white : textPrimaryColor),
                  ).container(padding: const EdgeInsets.only(bottom: 16))),
              ...pricingModel.notIncluded.map((String e) => Text(
                    e,
                    style: TextStyle(
                        fontFamily: Fonts.openSans,
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color:
                            !isActive ? const Color(0xFFbababa) : Colors.white),
                  ).container(padding: const EdgeInsets.only(bottom: 16))),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: NextButton(
                    padding: EdgeInsets.symmetric(
                        horizontal: context.width < 340 ? 30 : 50,
                        vertical: 12),
                    margin: EdgeInsets.zero,
                    color: isActive ? context.primaryColor : Colors.white,
                    outlineColor:
                        !isActive ? context.primaryColor : Colors.white,
                    variant: NextButtonVariant.outlined,
                    child: const Text('Buy now'),
                    onPressed: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
