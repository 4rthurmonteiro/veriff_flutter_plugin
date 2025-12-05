# Veriff Flutter Plugin

A Flutter plugin for integrating [Veriff](https://www.veriff.com/) identity verification into your Flutter applications. This plugin wraps the official Veriff SDKs for native platforms and extends support to the **web platform**.

## Supported Platforms

| Platform | Support |
|----------|---------|
| Android  | ✅      |
| iOS      | ✅      |
| Web      | ✅      |

## Features

- Seamless integration with Veriff identity verification
- Uses the official Veriff SDK for Android and iOS
- Extended web platform support via Veriff JS SDK
- Unified API across all platforms

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  veriff_flutter_plugin: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Usage

```dart
import 'package:veriff_flutter_plugin/veriff_flutter_plugin.dart';

// Start verification session
await VeriffFlutterPlugin.startVerification(sessionUrl: 'YOUR_SESSION_URL');
```

## Platform-Specific Setup

### Android

No additional setup required. The plugin uses the official Veriff Android SDK.

### iOS

No additional setup required. The plugin uses the official Veriff iOS SDK.

### Web

The plugin automatically loads the Veriff JS SDK. Make sure your web app is served over HTTPS in production.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.
