// import 'dart:io';

// // import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';

// enum DeviceType { web, phone, tablet, desktop }

// class Device {
//   // ignore: non_constant_identifier_names
//   static double MAX_PHONE_SHORTEST_SIDE = 550;
//   static Device? _device;

//   static bool get isTablet => _getDeviceInstance()._type == DeviceType.tablet;
//   static bool get isPhone => _getDeviceInstance()._type == DeviceType.phone;
//   static bool get isDesktop => _getDeviceInstance()._type == DeviceType.desktop;
//   static DeviceType get type => _getDeviceInstance()._type;

//   late final DeviceType _type;

//   // static Future<void> initialiize() async {
//   //     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//   //     final
//   // }

//   Device._() {
//     // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

//     if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
//       _type = DeviceType.desktop;
//     } else if (kIsWeb) {
//       _type = DeviceType.web;
//     } else {
//       _type = _getMobileType();
//     }
//   }

//   static Device _getDeviceInstance() {
//     return _device ??= Device._();
//   }

//   DeviceType _getMobileType() {
//     final data = MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
//     return data.size.shortestSide < MAX_PHONE_SHORTEST_SIDE ? DeviceType.phone : DeviceType.tablet;
//   }
// }
