import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'platform_query_data.dart';

/// Establishes a subtree in which device queries resolve to the given data.
///
/// For example, to learn the size of the current device (e.g., the window
/// containing your app), you can read the [PlatformQueryData.size] property from
/// the [PlatformQueryData] returned by [PlatformQuery.of]:
/// `PlatformQuery.of(context).size`.
///
/// Querying the current device using [PlatformQuery.of] will cause your widget to
/// rebuild automatically whenever the [PlatformQueryData] changes (e.g., if the
/// user rotates their device).
///
/// If no [PlatformQuery] is in scope then the [PlatformQuery.of] method will throw an
/// exception. Alternatively, [PlatformQuery.maybeOf] may be used, which returns
/// null instead of throwing if no [PlatformQuery] is in scope.
///
/// See also:
///
///  * [PlatformQueryData], the data structure that represents the metrics.
class PlatformQuery extends InheritedWidget {
  /// Creates a widget that provides [PlatformQueryData] to its descendants.
  ///
  /// The [data] and [child] arguments must not be null.
  PlatformQuery({
    Key? key,
    PlatformQueryData? data,
    required Widget child,
  })  : data = data ?? PlatformQueryData.detect(),
        super(
          key: key,
          child: child,
        );

  /// Contains information about the current device.
  ///
  /// For example, the [PlatformQueryData.size] property contains the width and
  /// height of the current window.
  final PlatformQueryData data;

  /// The data from the closest instance of this class that encloses the given
  /// context.
  ///
  /// You can use this function to query the size and orientation of the screen,
  /// as well as other device parameters (see [PlatformQueryData] for more
  /// examples). When that information changes, your widget will be scheduled to
  /// be rebuilt, keeping your widget up-to-date.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// PlatformQueryData device = PlatformQuery.of(context);
  /// ```
  ///
  /// If there is no [PlatformQuery] in scope, this will throw a [TypeError]
  /// exception in release builds, and throw a descriptive [FlutterError] in
  /// debug builds.
  ///
  /// See also:
  ///
  ///  * [maybeOf], which doesn't throw or assert if it doesn't find a
  ///    [PlatformQuery] ancestor, it returns null instead.
  static PlatformQueryData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PlatformQuery>()!.data;
  }

  /// The data from the closest instance of this class that encloses the given
  /// context, if any.
  ///
  /// Use this function if you want to allow situations where no [PlatformQuery] is
  /// in scope. Prefer using [PlatformQuery.of] in situations where a device query
  /// is always expected to exist.
  ///
  /// If there is no [PlatformQuery] in scope, then this function will return null.
  ///
  /// You can use this function to query the size and orientation of the screen,
  /// as well as other device parameters (see [PlatformQueryData] for more
  /// examples). When that information changes, your widget will be scheduled to
  /// be rebuilt, keeping your widget up-to-date.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// PlatformQueryData? platformQuery = PlatformQuery.maybeOf(context);
  /// if (platformQuery == null) {
  ///   // Do something else instead.
  /// }
  /// ```
  ///
  /// See also:
  ///
  ///  * [of], which will throw if it doesn't find a [PlatformQuery] ancestor,
  ///    instead of returning null.
  static PlatformQueryData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PlatformQuery>()?.data;
  }

  /// Returns isDesktop for the nearest PlatformQuery ancestor or [DeviceType.unknown], if
  /// no such ancestor exists.
  static PlatformType platformType(BuildContext context) {
    return PlatformQuery.maybeOf(context)?.platformType ?? PlatformType.unknown;
  }

  /// Returns isAndroid for the nearest PlatformQuery ancestor or false, if
  /// no such ancestor exists.
  static bool isAndroid(BuildContext context) {
    return PlatformQuery.maybeOf(context)?.isAndroid ?? false;
  }

  /// Returns isIos for the nearest PlatformQuery ancestor or false, if
  /// no such ancestor exists.
  static bool isIos(BuildContext context) {
    return PlatformQuery.maybeOf(context)?.isIos ?? false;
  }

  /// Returns isLinux for the nearest PlatformQuery ancestor or false, if
  /// no such ancestor exists.
  static bool isLinux(BuildContext context) {
    return PlatformQuery.maybeOf(context)?.isLinux ?? false;
  }

  /// Returns isMacos for the nearest PlatformQuery ancestor or false, if
  /// no such ancestor exists.
  static bool isMacos(BuildContext context) {
    return PlatformQuery.maybeOf(context)?.isMacos ?? false;
  }

  /// Returns isWindows for the nearest PlatformQuery ancestor or false, if
  /// no such ancestor exists.
  static bool isWindows(BuildContext context) {
    return PlatformQuery.maybeOf(context)?.isWindows ?? false;
  }

  /// Returns isWeb for the nearest PlatformQuery ancestor or false, if
  /// no such ancestor exists.
  static bool isWeb(BuildContext context) {
    return PlatformQuery.maybeOf(context)?.isWeb ?? false;
  }

  @override
  bool updateShouldNotify(PlatformQuery oldWidget) => data != oldWidget.data;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<PlatformQueryData>('data', data, showName: false));
  }
}
