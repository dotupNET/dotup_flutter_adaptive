import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../device/device_query.dart';
import '../device/device_query_data.dart';
import 'screen.dart';

class ScreenInfoPage extends StatelessWidget {
  const ScreenInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    double getPixel(double? size) {
      if (size == null) {
        return 0;
      } else {
        return size * mediaQuery.devicePixelRatio;
      }
    }

    const sectionTextStyle = TextStyle(color: Colors.white60);

    return Scaffold(
      appBar: AppBar(title: const Text('Screen info')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: OrientationBuilder(builder: (context, orientation) {
            final responsive = Screen.of(context);

            final type = DeviceQuery.maybeOf(context) ?? DeviceQueryData.detect(context: context);

            return ListView(
              children: [
                ListTile(
                  title: const Text('Orientation'),
                  subtitle: Text(describeEnum(mediaQuery.orientation)),
                ),
                ListTile(
                  title: const Text('Screen height'),
                  subtitle: Text('${mediaQuery.size.height} (${getPixel(mediaQuery.size.height)} Pixel)'),
                ),
                ListTile(
                  title: const Text('Screen width'),
                  subtitle: Text('${mediaQuery.size.width} (${getPixel(mediaQuery.size.width)} Pixel)'),
                ),
                Container(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  color: Colors.grey.shade900,
                  padding: const EdgeInsets.all(16.0),
                  child: const Center(child: Text('Padding', style: sectionTextStyle)),
                ),
                ListTile(
                  title: const Text('Padding left'),
                  subtitle: Text('${mediaQuery.padding.left}'),
                ),
                ListTile(
                  title: const Text('Padding top'),
                  subtitle: Text('${mediaQuery.padding.top}'),
                ),
                ListTile(
                  title: const Text('Padding right'),
                  subtitle: Text('${mediaQuery.padding.right}'),
                ),
                ListTile(
                  title: const Text('Padding bottom'),
                  subtitle: Text('${mediaQuery.padding.bottom}'),
                ),
                Container(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  color: Colors.grey.shade900,
                  padding: const EdgeInsets.all(16.0),
                  child: const Center(child: Text('View padding', style: sectionTextStyle)),
                ),
                ListTile(
                  title: const Text('View padding left'),
                  subtitle: Text('${mediaQuery.viewPadding.left}'),
                ),
                ListTile(
                  title: const Text('View padding top'),
                  subtitle: Text('${mediaQuery.viewPadding.top}'),
                ),
                ListTile(
                  title: const Text('View padding right'),
                  subtitle: Text('${mediaQuery.viewPadding.right}'),
                ),
                ListTile(
                  title: const Text('View padding bottom'),
                  subtitle: Text('${mediaQuery.viewPadding.bottom}'),
                ),
                Container(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  color: Colors.grey.shade900,
                  padding: const EdgeInsets.all(16.0),
                  child: const Center(child: Text('Others', style: sectionTextStyle)),
                ),
                ListTile(
                  title: const Text('Text scale factor'),
                  subtitle: Text('${mediaQuery.textScaleFactor}'),
                ),
                ListTile(
                  title: const Text('Device pixel ratio'),
                  subtitle: Text('${mediaQuery.devicePixelRatio}'),
                ),
                ListTile(
                  title: const Text('Color inverted'),
                  subtitle: Text('${mediaQuery.invertColors}'),
                ),
                ListTile(
                  title: const Text('Platform (System) brightness'),
                  subtitle: Text('${mediaQuery.platformBrightness}'),
                ),
                ListTile(
                  title: const Text('High Contrast'),
                  subtitle: Text('${mediaQuery.highContrast}'),
                ),
                ListTile(
                  title: const Text('Animations enabled'),
                  subtitle: Text('${!mediaQuery.disableAnimations}'),
                ),
                Container(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  color: Colors.grey.shade900,
                  padding: const EdgeInsets.all(16.0),
                  child: const Center(child: Text('dotup Responsive', style: sectionTextStyle)),
                ),
                ListTile(
                  title: Text('Extra large ( ${Screen.xlargeWidth} )'),
                  subtitle: Text(responsive.isExtraLargeScreen.toString()),
                ),
                ListTile(
                  title: Text('Large ( ${Screen.largeWidth} )'),
                  subtitle: Text(responsive.isLargeScreen.toString()),
                ),
                ListTile(
                  title: Text('Medium ( ${Screen.mediumWidth} )'),
                  subtitle: Text(responsive.isMediumScreen.toString()),
                ),
                ListTile(
                  title: Text('Small ( ${Screen.smallWidth} )'),
                  subtitle: Text(responsive.isSmallScreen.toString()),
                ),
                ListTile(
                  title: const Text('Extra small'),
                  subtitle: Text(responsive.isExtraSmallScreen.toString()),
                ),
                Container(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  color: Colors.grey.shade900,
                  padding: const EdgeInsets.all(16.0),
                  child: const Center(child: Text('DeviceQueryData', style: sectionTextStyle)),
                ),
                ListTile(
                  title: const Text('Device.type'),
                  subtitle: Text(describeEnum(type.deviceType)),
                ),
                ListTile(
                  title: const Text('Device.isDesktop'),
                  subtitle: Text(type.isDesktop.toString()),
                ),
                ListTile(
                  title: const Text('Device.isTablet'),
                  subtitle: Text(type.isTablet.toString()),
                ),
                ListTile(
                  title: const Text('Device.isPhone'),
                  subtitle: Text(type.isPhone.toString()),
                ),
                ListTile(
                  title: const Text('Device.isWatch'),
                  subtitle: Text(type.isWatch.toString()),
                ),
                ListTile(
                  title: const Text('Device.isTv'),
                  subtitle: Text(type.isTv.toString()),
                ),
                ListTile(
                  title: const Text('Device.isWeb'),
                  subtitle: Text(type.isWeb.toString()),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
