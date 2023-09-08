import 'package:flutter/widgets.dart';

import 'screen.dart';

class OrientationValue<T> {
  const OrientationValue({
    required this.portrait,
    required this.landscape,
  });

  final T landscape;

  final T portrait;

  T value(BuildContext context) {
    if (Screen.of(context).isPortrait) {
      return portrait;
    } else {
      return landscape;
    }
  }
}
