![flutter](https://badgen.net/pub/flutter-platform/xml) [![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) ![forks](https://badgen.net/github/forks/dotupNET/dotup_flutter_adaptive/) ![stars](https://badgen.net/github/stars/dotupNET/dotup_flutter_adaptive/)

# dotup_flutter_adaptive

Small package to develop adaptive and responive UIs based on device, platform or screen size.

https://docs.flutter.dev/ui/layout/responsive/adaptive-responsive

## Easy usage

```dart
// Powered by https://dotup.de
// Copyright (c) 2021, dotup IT solutions - Peter Ullrich


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

class DesktopWidget extends StatelessWidget {
  const DesktopWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('DesktopWidget');
  }
}


```

## Install
`flutter pub add dotup_flutter_adaptive`

## Links

> ### dotup_flutter_adaptive on [pub.dev](https://pub.dev/packages/dotup_flutter_adaptive)
>
> ### Other widgets on [pub.dev](https://pub.dev/packages?q=dotup)
> 
> ### Other open source flutter projects on [Github](https://github.com/search?q=dotup_flutter)
> 
> ### Other open source dart projects on [Github](https://github.com/search?q=dotup_dart)


# Flutter simulator | DFFP3
> Go to [https://flutter-apps.ml](https://flutter-apps.ml) and check out the awesome flutter simulator !

![Flutter simulator](https://flutter-apps.ml/wp-content/uploads/2021/10/Bildschirmfoto-2021-10-31-um-11.34.42-2048x1335.png)

> ## [dotup IT solutions](https://dotup.de)
