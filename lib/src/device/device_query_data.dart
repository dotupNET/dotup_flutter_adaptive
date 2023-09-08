import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

const MAX_PHONE_SHORTEST_SIDE = 550.0;

enum DeviceType {
  unknown,
  desktop,
  phone,
  tablet,
  tv,
  watch,
  web,
  car,
}

/// Information about a piece of device (e.g., a window).
///
/// For example, the [DeviceQueryData.size] property contains the width and
/// height of the current window.
///
/// To obtain the current [DeviceQueryData] for a given [BuildContext], use the
/// [DeviceQuery.of] function. For example, to obtain the size of the current
/// window, use `DeviceQuery.of(context).size`.
///
/// If no [DeviceQuery] is in scope then the [DeviceQuery.of] method will throw an
/// exception. Alternatively, [DeviceQuery.maybeOf] may be used, which returns
/// null instead of throwing if no [DeviceQuery] is in scope.
@immutable
class DeviceQueryData {
  /// Creates data for a device query with explicit values.
  const DeviceQueryData({required this.deviceType});

  /// Creates a new [DeviceQueryData] depending on platform.
  ///
  /// MAX_PHONE_SHORTEST_SIDE is used to detect phone or tablet devices
  ///
  /// Note:
  ///
  ///  * [DeviceType.watch] and [DeviceType.tv] are not supported.
  factory DeviceQueryData.detect({
    BuildContext? context,
    MediaQueryData? mediaQueryData,
    double shortestSideBreakpoint = MAX_PHONE_SHORTEST_SIDE,
  }) {
    assert(context != null || mediaQueryData != null);
    var type = DeviceType.unknown;

    if (kIsWeb) {
      type = DeviceType.web;
    } else if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
      type = DeviceType.desktop;
    } else {
      type = _getMobileType(
        context: context,
        mediaQueryData: mediaQueryData,
        shortestSideBreakpoint: shortestSideBreakpoint,
      );
    }

    return DeviceQueryData(deviceType: type);
  }

  static DeviceType _getMobileType({
    BuildContext? context,
    MediaQueryData? mediaQueryData,
    double shortestSideBreakpoint = MAX_PHONE_SHORTEST_SIDE,
  }) {
    assert(context != null || mediaQueryData != null);

    final data = mediaQueryData ?? MediaQuery.of(context!);
    return data.size.shortestSide < shortestSideBreakpoint ? DeviceType.phone : DeviceType.tablet;
  }

  final DeviceType deviceType;

  bool get isWeb => deviceType == DeviceType.web;
  bool get isPhone => deviceType == DeviceType.phone;
  bool get isTablet => deviceType == DeviceType.tablet;
  bool get isDesktop => deviceType == DeviceType.desktop;
  bool get isWatch => deviceType == DeviceType.watch;
  bool get isTv => deviceType == DeviceType.tv;
  bool get isCar => deviceType == DeviceType.car;
}
