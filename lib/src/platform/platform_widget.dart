import 'package:flutter/widgets.dart';

import 'platform_value.dart';

class PlatformWidget extends StatelessWidget {
  PlatformWidget({
    Key? key,
    Widget? android,
    Widget? fallback,
    Widget? ios,
    Widget? linux,
    Widget? macOS,
    Widget? web,
    Widget? windows,
  })  : value = PlatformValue<Widget>(
          android: android,
          fallback: fallback,
          ios: ios,
          linux: linux,
          macOS: macOS,
          web: web,
          windows: windows,
        ),
        super(key: key);

  final PlatformValue<Widget?> value;

  @override
  Widget build(BuildContext context) {
    return value.getValue(context)!;
  }
}
