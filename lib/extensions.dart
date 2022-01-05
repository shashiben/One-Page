import 'package:flutter/material.dart';
export 'animation_extensions.dart';

/// if ([width] > 1200) {
///      return "xl";
///    } else if (width > 992) {
///      return "lg";
///    } else if (width > 768) {
///      return "md";
///    } else if (width > 576) {
///      return "sm";
///    } else {
///      return "";
///    }
extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get size => mediaQuery.size;

  double get width => size.width;
  double get height => size.height;

  double get blockSizeHorizontal => width / 100;
  double get blockSizeVertical => height / 100;

  ThemeData get themeData => Theme.of(this);
  TextTheme get textTheme => themeData.textTheme;
  ButtonThemeData get buttonTheme => themeData.buttonTheme;

  EdgeInsets get mediaQueryPadding => MediaQuery.of(this).padding;
  EdgeInsets get mediaQueryViewPadding => MediaQuery.of(this).viewPadding;
  EdgeInsets get mediaQueryViewInsets => MediaQuery.of(this).viewInsets;

  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;

  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
  double get shortestSide => size.shortestSide;

  Orientation get orientation => MediaQuery.of(this).orientation;

  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isMobile => (shortestSide < 600);
  bool get isSmallTablet => (shortestSide >= 600);
  bool get isLargeTablet => (shortestSide >= 720);
  bool get isTablet => isSmallTablet || isLargeTablet;
  bool get isXl => size.width > 1200;
  bool get isLg => size.width > 992 && size.width <= 1200;
  bool get isMd => size.width > 1200 && size.width <= 992;
  bool get isSm => size.width > 1200 && size.width <= 768;
  bool get isXs => size.width > 1200 && size.width <= 576;
  bool get alwaysUse24HourFormat => MediaQuery.of(this).alwaysUse24HourFormat;

}

extension WidgetExtensions on Widget {
  Widget padding(EdgeInsets? padding, {EdgeInsets? margin}) => Container(
        padding: padding,
        margin: margin,
        child: this,
      );
  Widget decoration(BoxDecoration decoration) => DecoratedBox(
        decoration: decoration,
        child: this,
      );
  Widget center() => Center(
        child: this,
      );
  Widget onTap(void Function() onTap) => InkWell(
        onTap: onTap,
        child: this,
      );
}
