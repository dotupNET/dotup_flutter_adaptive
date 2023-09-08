import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

enum PlatformType {
  unknown,
  android,
  ios,
  linux,
  macOS,
  windows,
  web,
}

/// Information about a piece of device (e.g., a window).
///
/// For example, the [PlatformQueryData.size] property contains the width and
/// height of the current window.
///
/// To obtain the current [PlatformQueryData] for a given [BuildContext], use the
/// [PlatformQuery.of] function. For example, to obtain the size of the current
/// window, use `PlatformQuery.of(context).size`.
///
/// If no [PlatformQuery] is in scope then the [PlatformQuery.of] method will throw an
/// exception. Alternatively, [PlatformQuery.maybeOf] may be used, which returns
/// null instead of throwing if no [PlatformQuery] is in scope.
@immutable
class PlatformQueryData {
  /// Creates data for a device query with explicit values.
  const PlatformQueryData({required this.platformType});

  /// Creates a new [PlatformQueryData] depending on platform.
  ///
  /// MAX_PHONE_SHORTEST_SIDE is used to detect phone or tablet devices
  ///
  /// Note:
  ///
  ///  * [DeviceType.watch] and [DeviceType.tv] are not supported.
  factory PlatformQueryData.detect() {
    var platform = PlatformType.unknown;

    if (kIsWeb) {
      platform = PlatformType.web;
    } else if (Platform.isIOS) {
      platform = PlatformType.ios;
    } else if (Platform.isAndroid) {
      platform = PlatformType.android;
    } else if (Platform.isLinux) {
      platform = PlatformType.linux;
    } else if (Platform.isMacOS) {
      platform = PlatformType.macOS;
    } else if (Platform.isWindows) {
      platform = PlatformType.windows;
    } else {
      platform = PlatformType.unknown;
    }

    return PlatformQueryData(platformType: platform);
  }

  final PlatformType platformType;

  bool get isAndroid => platformType == PlatformType.android;
  bool get isIos => platformType == PlatformType.ios;
  bool get isLinux => platformType == PlatformType.linux;
  bool get isMacos => platformType == PlatformType.macOS;
  bool get isWeb => platformType == PlatformType.web;
  bool get isWindows => platformType == PlatformType.windows;
}
