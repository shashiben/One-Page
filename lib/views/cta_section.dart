import 'package:bootstrap/bootstrap_button.dart';
import 'package:flutter/material.dart';
import 'package:bootstrap/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

class CTASection extends StatelessWidget {
  const CTASection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 50),
      decoration: BoxDecoration(color: context.themeData.primaryColor),
      child: Column(
        children: [
          Text(
            "Call To Action",
            style: GoogleFonts.raleway(
                fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: context.isMobile ? context.width * 0.8 : context.width * 0.6,
            child: Text(
              "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              style: GoogleFonts.openSans(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ).padding(const EdgeInsets.only(top: 20, bottom: 20)),
          ),
          BootstrapButton(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
              color: Colors.white,
              outlineColor: context.themeData.primaryColor,
              variant: ButtonVariant.outlined,
              child: ((isHovered) => Text(
                    "Call To Action",
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold,
                        color: isHovered
                            ? context.themeData.primaryColor
                            : Colors.white),
                  )),
              onPressed: () {})
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
