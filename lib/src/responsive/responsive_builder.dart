import 'package:flutter/material.dart';

import '../screen/screen.dart';

void isNotNull<T>(T target, T? value) {
  if (value != null) {
    target = value;
  }
}

class ResponsiveBuilder extends StatelessWidget {
  final WidgetBuilder? xlargeScreen;
  final WidgetBuilder? largeScreen;
  final WidgetBuilder? mediumScreen;
  final WidgetBuilder? smallScreen;
  final WidgetBuilder? xsmallScreen;
  late final WidgetBuilder _fallback;

  ResponsiveBuilder({
    Key? key,
    this.xlargeScreen,
    this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
    this.xsmallScreen,
    WidgetBuilder? fallback,
  }) : super(key: key) {
    _fallback = fallback ?? (_) => const SizedBox.shrink();
  }

  factory ResponsiveBuilder.upto({
    WidgetBuilder? xlargeScreen,
    WidgetBuilder? largeScreen,
    WidgetBuilder? mediumScreen,
    WidgetBuilder? smallScreen,
    // WidgetBuilder? xsmallScreen,
    WidgetBuilder? fallback,
  }) {
    WidgetBuilder? xlargeScreenValue;
    WidgetBuilder? largeScreenValue;
    WidgetBuilder? mediumScreenValue;
    WidgetBuilder? smallScreenValue;
    WidgetBuilder? xsmallScreenValue;
    WidgetBuilder? fallbackValue = fallback;

    if (xlargeScreen != null) {
      xsmallScreenValue = xlargeScreen;
      smallScreenValue = xlargeScreen;
      mediumScreenValue = xlargeScreen;
      largeScreenValue = xlargeScreen;
      xlargeScreenValue = xlargeScreen;
    }

    if (largeScreen != null) {
      xsmallScreenValue = largeScreen;
      smallScreenValue = largeScreen;
      mediumScreenValue = largeScreen;
      largeScreenValue = largeScreen;
    }

    if (mediumScreen != null) {
      xsmallScreenValue = mediumScreen;
      smallScreenValue = mediumScreen;
      mediumScreenValue = mediumScreen;
    }

    if (smallScreen != null) {
      xsmallScreenValue = smallScreen;
      smallScreenValue = smallScreen;
    }

    return ResponsiveBuilder(
      xsmallScreen: xsmallScreenValue,
      smallScreen: smallScreenValue,
      mediumScreen: mediumScreenValue,
      largeScreen: largeScreenValue,
      xlargeScreen: xlargeScreenValue,
      fallback: fallbackValue,
    );
  }

  factory ResponsiveBuilder.from(
      // WidgetBuilder? xlargeScreen,
      {
    WidgetBuilder? largeScreen,
    WidgetBuilder? mediumScreen,
    WidgetBuilder? smallScreen,
    WidgetBuilder? fallback,
    WidgetBuilder? xsmallScreen,
  }) {
    WidgetBuilder? xlargeScreenValue;
    WidgetBuilder? largeScreenValue;
    WidgetBuilder? mediumScreenValue;
    WidgetBuilder? smallScreenValue;
    WidgetBuilder? xsmallScreenValue;
    WidgetBuilder? fallbackValue = fallback;

    if (xsmallScreen != null) {
      xsmallScreenValue = xsmallScreen;
      smallScreenValue = xsmallScreen;
      mediumScreenValue = xsmallScreen;
      largeScreenValue = xsmallScreen;
      xlargeScreenValue = xsmallScreen;
    }

    if (smallScreen != null) {
      smallScreenValue = smallScreen;
      mediumScreenValue = smallScreen;
      largeScreenValue = smallScreen;
      xlargeScreenValue = smallScreen;
    }

    if (mediumScreen != null) {
      mediumScreenValue = mediumScreen;
      largeScreenValue = mediumScreen;
      xlargeScreenValue = mediumScreen;
    }

    if (largeScreen != null) {
      largeScreenValue = largeScreen;
      xlargeScreenValue = largeScreen;
    }

    return ResponsiveBuilder(
      xsmallScreen: xsmallScreenValue,
      smallScreen: smallScreenValue,
      mediumScreen: mediumScreenValue,
      largeScreen: largeScreenValue,
      xlargeScreen: xlargeScreenValue,
      fallback: fallbackValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    // return LayoutBuilder(builder: (context, constraints) {
    final responsive = Screen.of(context);

    switch (responsive.screenSize) {
      case ScreenSize.xlarge:
        final builder = xlargeScreen ?? _fallback;
        return builder(context);

      case ScreenSize.large:
        final builder = largeScreen ?? _fallback;
        return builder(context);

      case ScreenSize.medium:
        final builder = mediumScreen ?? _fallback;
        return builder(context);

      case ScreenSize.small:
        final builder = smallScreen ?? _fallback;
        return builder(context);

      case ScreenSize.xsmall:
        final builder = xsmallScreen ?? _fallback;
        return builder(context);

      default:
        final builder = _fallback;
        return builder(context);
    }
  }
}
  // @override
  // Widget build(BuildContext context) {
  //   return LayoutBuilder(builder: (context, constraints) {
  //     if (Responsive.isLargeScreen(context)) {
  //       final builder = largeScreen ?? mediumScreen ?? smallScreen ?? _fallback;
  //       return builder(context);
  //     } else if (Responsive.isSmallScreen(context)) {
  //       final builder = smallScreen ?? _fallback;
  //       return builder(context);
  //     } else {
  //       final builder = mediumScreen ?? smallScreen ?? _fallback;
  //       return builder(context);
  //     }
  //   });
  // }

