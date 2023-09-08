import 'package:flutter/widgets.dart';

import 'platform_value.dart';

class PlatformBuilder extends StatelessWidget {
  PlatformBuilder({
    Key? key,
    WidgetBuilder? android,
    WidgetBuilder? ios,
    WidgetBuilder? linux,
    WidgetBuilder? macOS,
    WidgetBuilder? fallback,
    WidgetBuilder? windows,
    WidgetBuilder? web,
  }) : super(key: key) {
    _builder = PlatformValue<WidgetBuilder>(
      android: android,
      fallback: fallback,
      ios: ios,
      linux: linux,
      macOS: macOS,
      web: web,
      windows: windows,
    );
  }

  late final PlatformValue<WidgetBuilder> _builder;

  @override
  Widget build(BuildContext context) {
    return _builder.getValue(context)(context);
  }
}
