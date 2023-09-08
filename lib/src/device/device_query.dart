import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'device_query_data.dart';

/// Establishes a subtree in which device queries resolve to the given data.
///
/// For example, to learn the size of the current device (e.g., the window
/// containing your app), you can read the [DeviceQueryData.size] property from
/// the [DeviceQueryData] returned by [DeviceQuery.of]:
/// `DeviceQuery.of(context).size`.
///
/// Querying the current device using [DeviceQuery.of] will cause your widget to
/// rebuild automatically whenever the [DeviceQueryData] changes (e.g., if the
/// user rotates their device).
///
/// If no [DeviceQuery] is in scope then the [DeviceQuery.of] method will throw an
/// exception. Alternatively, [DeviceQuery.maybeOf] may be used, which returns
/// null instead of throwing if no [DeviceQuery] is in scope.
///
/// See also:
///
///  * [DeviceQueryData], the data structure that represents the metrics.
class DeviceQuery extends InheritedWidget {
  /// Creates a widget that provides [DeviceQueryData] to its descendants.
  ///
  /// The [data] and [child] arguments must not be null.
  DeviceQuery({
    Key? key,
    DeviceQueryData? data,
    BuildContext? context,
    MediaQueryData? mediaQueryData,
    required Widget child,
  })  : data = data ??
            DeviceQueryData.detect(
              context: context,
              mediaQueryData: mediaQueryData,
            ),
        super(key: key, child: child);

  // /// Creates a new [DeviceQuery] as tablet.
  // ///
  // /// The [child] argument is required and must not be null.
  // factory DeviceQuery.tablet({
  //   Key? key,
  //   required Widget child,
  // }) {
  //   return DeviceQuery(
  //     key: key,
  //     data: const DeviceQueryData(deviceType: DeviceType.tablet),
  //     child: child,
  //   );
  // }

  /// Contains information about the current device.
  ///
  /// For example, the [DeviceQueryData.size] property contains the width and
  /// height of the current window.
  final DeviceQueryData data;

  /// The data from the closest instance of this class that encloses the given
  /// context.
  ///
  /// You can use this function to query the size and orientation of the screen,
  /// as well as other device parameters (see [DeviceQueryData] for more
  /// examples). When that information changes, your widget will be scheduled to
  /// be rebuilt, keeping your widget up-to-date.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// DeviceQueryData device = DeviceQuery.of(context);
  /// ```
  ///
  /// If there is no [DeviceQuery] in scope, this will throw a [TypeError]
  /// exception in release builds, and throw a descriptive [FlutterError] in
  /// debug builds.
  ///
  /// See also:
  ///
  ///  * [maybeOf], which doesn't throw or assert if it doesn't find a
  ///    [DeviceQuery] ancestor, it returns null instead.
  static DeviceQueryData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DeviceQuery>()!.data;
  }

  /// The data from the closest instance of this class that encloses the given
  /// context, if any.
  ///
  /// Use this function if you want to allow situations where no [DeviceQuery] is
  /// in scope. Prefer using [DeviceQuery.of] in situations where a device query
  /// is always expected to exist.
  ///
  /// If there is no [DeviceQuery] in scope, then this function will return null.
  ///
  /// You can use this function to query the size and orientation of the screen,
  /// as well as other device parameters (see [DeviceQueryData] for more
  /// examples). When that information changes, your widget will be scheduled to
  /// be rebuilt, keeping your widget up-to-date.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// DeviceQueryData? deviceQuery = DeviceQuery.maybeOf(context);
  /// if (deviceQuery == null) {
  ///   // Do something else instead.
  /// }
  /// ```
  ///
  /// See also:
  ///
  ///  * [of], which will throw if it doesn't find a [DeviceQuery] ancestor,
  ///    instead of returning null.
  static DeviceQueryData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DeviceQuery>()?.data;
  }

  /// Returns isDesktop for the nearest DeviceQuery ancestor or [DeviceType.unknown], if
  /// no such ancestor exists.
  static DeviceType deviceType(BuildContext context) {
    return DeviceQuery.maybeOf(context)?.deviceType ?? DeviceType.unknown;
  }

  /// Returns isDesktop for the nearest DeviceQuery ancestor or false, if
  /// no such ancestor exists.
  static bool isDesktop(BuildContext context) {
    return DeviceQuery.maybeOf(context)?.isDesktop ?? false;
  }

  /// Returns isPhone for the nearest DeviceQuery ancestor or false, if
  /// no such ancestor exists.
  static bool isPhone(BuildContext context) {
    return DeviceQuery.maybeOf(context)?.isPhone ?? false;
  }

  /// Returns isTablet for the nearest DeviceQuery ancestor or false, if
  /// no such ancestor exists.
  static bool isTablet(BuildContext context) {
    return DeviceQuery.maybeOf(context)?.isTablet ?? false;
  }

  /// Returns isTv for the nearest DeviceQuery ancestor or false, if
  /// no such ancestor exists.
  static bool isTv(BuildContext context) {
    return DeviceQuery.maybeOf(context)?.isTv ?? false;
  }

  /// Returns isWatch for the nearest DeviceQuery ancestor or false, if
  /// no such ancestor exists.
  static bool isWatch(BuildContext context) {
    return DeviceQuery.maybeOf(context)?.isWatch ?? false;
  }

  /// Returns isWeb for the nearest DeviceQuery ancestor or false, if
  /// no such ancestor exists.
  static bool isWeb(BuildContext context) {
    return DeviceQuery.maybeOf(context)?.isWeb ?? false;
  }

  @override
  bool updateShouldNotify(DeviceQuery oldWidget) => data != oldWidget.data;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<DeviceQueryData>('data', data, showName: false));
  }
}
