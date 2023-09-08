import 'package:dotup_flutter_adaptive/dotup_flutter_adaptive.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: PlatformQuery(
            child: PlatformWidget(
              fallback: const FallbackWidget(),
              macOS: const MacWidget(),
              windows: DeviceQuery(
                context: context,
                child: const DeviceWidget(
                  desktop: DesktopWidget(),
                  fallback: FallbackWidget(),
                ),
              ),
              web: const Text('web'),
            ),
          ),
        ),
      ),
    );
  }
}

class WindwosWidget extends StatelessWidget {
  const WindwosWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Windows');
  }
}

class FallbackWidget extends StatelessWidget {
  const FallbackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Fallback');
  }
}

class MacWidget extends StatelessWidget {
  const MacWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('MacWidget');
  }
}

class DesktopWidget extends StatelessWidget {
  const DesktopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('DesktopWidget');
  }
}
