import 'package:flutter/material.dart';

import '../screen/screen.dart';

class ResponsiveValue<T> {
  final T? xlarge;
  final T? large;
  final T? medium;
  final T? small;
  final T? xsmall;
  final T? fallback;

  ResponsiveValue({
    this.xlarge,
    this.large,
    this.medium,
    this.small,
    this.xsmall,
    this.fallback,
    bool allowNull = false,
  }) {
    if (!allowNull) {
      assert((xsmall != null || fallback != null) &&
          (small != null || fallback != null) &&
          (medium != null || fallback != null) &&
          (large != null || fallback != null) &&
          (xlarge != null || fallback != null));
    }
  }

  factory ResponsiveValue.upto({
    bool allowNull = false,
    T? xlarge,
    T? large,
    T? medium,
    T? small,
    // T? xsmall,
    T? fallback,
  }) {
    T? xlargeValue;
    T? largeValue;
    T? mediumValue;
    T? smallValue;
    T? xsmallValue;

    if (xlarge != null) {
      xsmallValue = xlarge;
      smallValue = xlarge;
      mediumValue = xlarge;
      largeValue = xlarge;
      xlargeValue = xlarge;
    }

    if (large != null) {
      xsmallValue = large;
      smallValue = large;
      mediumValue = large;
      largeValue = large;
    }

    if (medium != null) {
      xsmallValue = medium;
      smallValue = medium;
      mediumValue = medium;
    }

    if (small != null) {
      xsmallValue = small;
      smallValue = small;
    }

    return ResponsiveValue(
      allowNull: allowNull,
      xsmall: xsmallValue,
      small: smallValue,
      medium: mediumValue,
      large: largeValue,
      xlarge: xlargeValue,
      fallback: fallback,
    );
  }

  factory ResponsiveValue.from(
      // T? xlarge,
      {
    bool allowNull = false,
    T? large,
    T? medium,
    T? small,
    T? xsmall,
    T? fallback,
  }) {
    T? xlargeValue;
    T? largeValue;
    T? mediumValue;
    T? smallValue;
    T? xsmallValue;

    if (xsmall != null) {
      xsmallValue = xsmall;
      smallValue = xsmall;
      mediumValue = xsmall;
      largeValue = xsmall;
      xlargeValue = xsmall;
    }

    if (small != null) {
      smallValue = small;
      mediumValue = small;
      largeValue = small;
      xlargeValue = small;
    }

    if (medium != null) {
      mediumValue = medium;
      largeValue = medium;
      xlargeValue = medium;
    }

    if (large != null) {
      largeValue = large;
      xlargeValue = large;
    }

    return ResponsiveValue(
      allowNull: allowNull,
      xsmall: xsmallValue,
      small: smallValue,
      medium: mediumValue,
      large: largeValue,
      xlarge: xlargeValue,
      fallback: fallback,
    );
  }

  T fromScreen(Screen screen) => _getValue(screen)!;

  T value(BuildContext context) => _getValue(Screen.of(context))!;

  T? nullableValue(BuildContext context) => _getValue(Screen.of(context));

  T? _getValue(Screen screen) {
    switch (screen.screenSize) {
      case ScreenSize.xlarge:
        return xlarge ?? fallback;
      case ScreenSize.large:
        return large ?? fallback;
      case ScreenSize.medium:
        return medium ?? fallback;
      case ScreenSize.small:
        return small ?? fallback;
      case ScreenSize.xsmall:
        return xsmall ?? fallback;
      default:
        return fallback;
    }
  }
}
