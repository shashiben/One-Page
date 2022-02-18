import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';

ThemeData themeData(BuildContext context) => ThemeData(
    primaryColor: primaryColor,
    backgroundColor: Colors.white,
    buttonTheme: const ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    textTheme: Theme.of(context)
        .textTheme
        .apply(
          bodyColor: textPrimaryColor,
          displayColor: textSecondaryColor,
        )
        .copyWith(
            headline1:
                const TextStyle(fontFamily: Fonts.poppins, fontSize: 56)));
