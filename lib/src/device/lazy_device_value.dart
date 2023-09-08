import 'package:flutter/material.dart';

import 'device_value.dart';

class LayzDeviceValue<T> {
  LayzDeviceValue({
    ValueGetter<T>? web,
    ValueGetter<T>? phone,
    ValueGetter<T>? tablet,
    ValueGetter<T>? desktop,
    ValueGetter<T>? fallback,
  }) {
    values = DeviceValue(
      desktop: desktop,
      phone: phone,
      tablet: tablet,
      web: web,
      fallback: fallback,
    );
  }

  late final DeviceValue<ValueGetter<T>> values;

  T value(BuildContext context) => values.getValue(context)();
}
