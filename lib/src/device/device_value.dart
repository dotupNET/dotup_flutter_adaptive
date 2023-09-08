import 'package:flutter/widgets.dart';

import 'device_query.dart';
import 'device_query_data.dart';

class DeviceValue<T> {
  const DeviceValue({
    T? web,
    T? phone,
    T? tablet,
    T? desktop,
    T? tv,
    T? watch,
    T? fallback,
  })  : _web = web,
        _tablet = tablet,
        _phone = phone,
        _tv = tv,
        _watch = watch,
        _desktop = desktop,
        _fallback = fallback;

  final T? _fallback;
  T get fallback => _fallback!;

  final T? _web;
  T get web => _web ?? _fallback!;

  final T? _tablet;
  T get tablet => _tablet ?? _fallback!;

  final T? _phone;
  T get phone => _phone ?? _fallback!;

  final T? _watch;
  T get watch => _watch ?? _fallback!;

  final T? _tv;
  T get tv => _tv ?? _fallback!;

  final T? _desktop;
  T get desktop => _desktop ?? _fallback!;

  T getValue(BuildContext context) => maybeGetValue(context, true)!;

  T? maybeGetValue(BuildContext context, [bool useFallback = false]) {
    final device = DeviceQuery.of(context);

    switch (device.deviceType) {
      case DeviceType.desktop:
        return _desktop ?? (useFallback ? _fallback : null);

      case DeviceType.phone:
        return _phone ?? (useFallback ? _fallback : null);

      case DeviceType.tablet:
        return _tablet ?? (useFallback ? _fallback : null);

      case DeviceType.tv:
        return _tv ?? (useFallback ? _fallback : null);

      case DeviceType.watch:
        return _watch ?? (useFallback ? _fallback : null);

      case DeviceType.web:
        return _web ?? (useFallback ? _fallback : null);

      default:
        return _fallback;
    }
  }
}
