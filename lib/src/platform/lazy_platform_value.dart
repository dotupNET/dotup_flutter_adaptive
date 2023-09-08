import 'package:flutter/widgets.dart';

import 'platform_value.dart';

class LayzPlatformValue<T> {
  LayzPlatformValue({
    ValueGetter<T>? android,
    ValueGetter<T>? ios,
    ValueGetter<T>? linux,
    ValueGetter<T>? macOS,
    ValueGetter<T>? fallback,
    ValueGetter<T>? windows,
    ValueGetter<T>? web,
    ValueGetter<T>? tablet,
    ValueGetter<T>? phone,
    ValueGetter<T>? desktop,
  }) {
    values = PlatformValue(
      android: android,
      ios: ios,
      linux: linux,
      macOS: macOS,
      fallback: fallback,
      windows: windows,
      web: web,
    );
  }

  late final PlatformValue<ValueGetter<T>> values;

  T getValue(BuildContext context) => values.getValue(context)();
}
