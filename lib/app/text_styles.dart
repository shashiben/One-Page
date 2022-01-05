import 'package:flutter/material.dart';
import 'package:bootstrap/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

TextStyle h1(BuildContext context) {
  return GoogleFonts.poppins(
      fontSize: context.width >= 992 ? 56 : 28,
      color: textPrimaryColor,
      fontWeight: FontWeight.w700);
}

TextStyle h2(BuildContext context) {
  return GoogleFonts.raleway(
      fontSize: context.width >= 992 ? 22 : 18,
      color: textSecondaryColor,
      fontWeight: FontWeight.w400);
}

TextStyle a(BuildContext context) {
  return GoogleFonts.raleway(
      fontSize: context.width >= 992 ? 18 : 16,
      color: textPrimaryColor,
      fontWeight: FontWeight.bold);
}

class SectionTitle {
  static TextStyle h2(BuildContext context) {
    return GoogleFonts.raleway(
        fontSize: 32, color: textPrimaryColor, fontWeight: FontWeight.bold);
  }

  static TextStyle p(BuildContext context) {
    return GoogleFonts.openSans(
      fontSize: 14,
      color: const Color(0xFF919191),
    );
  }
}

class AboutTextStyles {
  static TextStyle li(BuildContext context) {
    return GoogleFonts.openSans(
      fontSize: 14,
      color: const Color(0xFF444444),
    );
  }
}
