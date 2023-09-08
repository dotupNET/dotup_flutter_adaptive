import 'package:flutter/material.dart';

enum ScreenSize {
  unknown,
  xsmall,
  small,
  medium,
  large,
  xlarge,
}

class Screen {
  static double xlargeWidth = 1400;
  static double largeWidth = 1200;
  static double mediumWidth = 1024;
  static double smallWidth = 380;

  final BuildContext context;
  late final MediaQueryData mediaQueryData;

  Screen._(this.context, {bool? useSafeSize}) {
    mediaQueryData = MediaQuery.of(context);
  }

  factory Screen.of(BuildContext context, {bool? useSafeSize}) {
    return Screen._(context, useSafeSize: useSafeSize);
  }

  double get width => screenWidth;

  double get height => screenHeight;

  /// The width of the media in logical pixels.
  /// MediaQuery.of(context).size.width
  double get screenWidth => mediaQueryData.size.width;

  /// The height of the media in logical pixels.
  /// MediaQuery.of(context).size.height
  double get screenHeight => mediaQueryData.size.height;

  Orientation get orientation => mediaQueryData.orientation;
  bool get isPortrait => mediaQueryData.orientation == Orientation.portrait;
  bool get isLandscape => mediaQueryData.orientation == Orientation.landscape;

  bool isXL() => isExtraLargeScreen;
  bool get isExtraLargeScreen => width >= xlargeWidth;

  bool isL() => isLargeScreen;
  bool get isLargeScreen => width >= largeWidth && width < xlargeWidth;

  bool isM() => isMediumScreen;
  bool get isMediumScreen => width >= mediumWidth && width < largeWidth;

  bool isS() => isSmallScreen;
  bool get isSmallScreen => width >= smallWidth && width < mediumWidth;

  bool isXS() => isExtraSmallScreen;
  bool get isExtraSmallScreen => width < smallWidth;

  ScreenSize get screenSize => getScreenSize();
  ScreenSize getScreenSize() {
    if (isExtraSmallScreen) {
      return ScreenSize.xsmall;
    } else if (isSmallScreen) {
      return ScreenSize.small;
    } else if (isMediumScreen) {
      return ScreenSize.medium;
    } else if (isLargeScreen) {
      return ScreenSize.large;
    } else if (isExtraLargeScreen) {
      return ScreenSize.xlarge;
    } else {
      return ScreenSize.unknown;
    }
  }
}
