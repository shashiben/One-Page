import 'package:bootstrap/app/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData(BuildContext context) => ThemeData(
    primaryColor: primaryColor,
    textTheme: Theme.of(context)
        .textTheme
        .apply(
          bodyColor: textPrimaryColor,
          displayColor: textSecondaryColor,
        )
        .copyWith(
            headline1:
                GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 56))));
