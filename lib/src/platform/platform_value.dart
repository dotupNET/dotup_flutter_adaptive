import 'package:flutter/widgets.dart';

import 'platform_query.dart';
import 'platform_query_data.dart';

class PlatformValue<T> {
  const PlatformValue({
    T? android,
    T? ios,
    T? linux,
    T? macOS,
    T? fallback,
    T? windows,
    T? web,
  })  : _android = android,
        _ios = ios,
        _linux = linux,
        _macOS = macOS,
        _fallback = fallback,
        _windows = windows,
        _web = web;

  final T? _android;
  T get android => _android ?? _fallback!;

  final T? _ios;
  T get ios => _ios ?? _fallback!;

  final T? _macOS;
  T get macOS => _macOS ?? _fallback!;

  final T? _linux;
  T get linux => _linux ?? _fallback!;

  final T? _windows;
  T get windows => _windows ?? _fallback!;

  final T? _fallback;
  T get fallback => _fallback!;

  final T? _web;
  T get web => _web ?? _fallback!;

  T getValue(BuildContext context) => _getValue(context);

  T _getValue(BuildContext context) {
    final platform = PlatformQuery.of(context);

    switch (platform.platformType) {
      case PlatformType.android:
        return android;

      case PlatformType.ios:
        return ios;

      case PlatformType.linux:
        return linux;

      case PlatformType.macOS:
        return macOS;

      case PlatformType.windows:
        return windows;

      case PlatformType.web:
        return web;

      default:
        return fallback;
    }
  }
}
