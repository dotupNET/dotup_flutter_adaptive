import 'package:flutter/material.dart';

import 'responsive_value.dart';

class LayzResponsiveValue<T> {
  LayzResponsiveValue({
    ValueGetter<T>? xlarge,
    ValueGetter<T>? large,
    ValueGetter<T>? medium,
    ValueGetter<T>? small,
    ValueGetter<T>? xsmall,
    ValueGetter<T>? fallback,
    bool allowNull = false,
  }) {
    values = ResponsiveValue(
      allowNull: allowNull,
      large: large,
      medium: medium,
      small: small,
      xlarge: xlarge,
      xsmall: xsmall,
      fallback: fallback,
    );
  }

  late final ResponsiveValue<ValueGetter<T>> values;

  T value(BuildContext context) => values.value(context)();
}
