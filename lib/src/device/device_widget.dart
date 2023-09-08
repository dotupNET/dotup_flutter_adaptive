import 'package:flutter/widgets.dart';

import 'device_query.dart';
import 'device_query_data.dart';

class DeviceWidget extends StatelessWidget {
  const DeviceWidget({
    Key? key,
    Widget? desktop,
    Widget? phone,
    Widget? tablet,
    Widget? web,
    Widget? tv,
    Widget? watch,
    Widget? fallback,
  })  : _web = web,
        _tablet = tablet,
        _phone = phone,
        _desktop = desktop,
        _watch = watch,
        _tv = tv,
        _fallback = fallback,
        super(key: key);

  final Widget? _fallback;
  final Widget? _web;
  final Widget? _tablet;
  final Widget? _phone;
  final Widget? _desktop;
  final Widget? _watch;
  final Widget? _tv;

  // T get value => _getValue();

  @override
  Widget build(BuildContext context) {
    final device = DeviceQuery.of(context);
    switch (device.deviceType) {
      case DeviceType.desktop:
        return _desktop ?? _fallback!;

      case DeviceType.phone:
        return _phone ?? _fallback!;

      case DeviceType.tablet:
        return _tablet ?? _fallback!;

      case DeviceType.tv:
        return _tv ?? _fallback!;

      case DeviceType.watch:
        return _watch ?? _fallback!;

      case DeviceType.web:
        return _web ?? _fallback!;

      default:
        return _fallback!;
    }
  }
}
