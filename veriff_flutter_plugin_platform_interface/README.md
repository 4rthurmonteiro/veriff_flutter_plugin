# veriff_flutter_plugin_platform_interface

[![Pub Version](https://img.shields.io/pub/v/veriff_flutter_plugin_platform_interface.svg)](https://pub.dev/packages/veriff_flutter_plugin_platform_interface)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-%3E%3D1.17.0-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-%5E3.10.3-blue.svg)](https://dart.dev)

A common platform interface for the [Veriff Flutter plugin](https://github.com/arthurmonteiroalvesmelo/veriff_flutter_plugin). This package provides the abstract platform interface that platform-specific implementations must extend to provide Veriff identity verification functionality.

## Overview

This package defines the platform interface contract for the Veriff Flutter plugin, allowing different platform implementations (iOS, Android, Web) to provide their own specific implementations while maintaining a consistent API.

> **Note:** This package is intended for plugin developers implementing platform-specific Veriff integrations. If you're looking to add Veriff verification to your app, use the main [`veriff_flutter_plugin`](https://pub.dev/packages/veriff_flutter_plugin) package instead.

## Features

- **Platform Interface**: Abstract base class for Veriff Flutter plugin implementations
- **Method Channel Implementation**: Default implementation using native Veriff SDK
- **Verification Support**: Start Veriff verification sessions with customizable options
- **Cross-Platform**: Works across iOS, Android, and Web platforms
- **Type Safety**: Full Dart null safety support
- **Well Documented**: Comprehensive API documentation

## Getting Started

### Prerequisites

- Flutter SDK (>=1.17.0)
- Dart SDK (^3.10.3)

### Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  veriff_flutter_plugin_platform_interface: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Usage

This package is typically used internally by platform-specific implementations of the Veriff Flutter plugin. If you're implementing a custom platform implementation, extend `VeriffFlutterPluginPlatformInterface`:

```dart
import 'package:veriff_flutter_plugin_platform_interface/veriff_flutter_plugin_platform_interface.dart';

class MyCustomPlatformImplementation extends VeriffFlutterPluginPlatformInterface {
  @override
  Future<Result?> startVerification(
    String sessionUrl, {
    Branding? branding,
    String? languageLocale,
    bool? useCustomIntroScreen,
    String? vendorData,
    String webOnlyWindowName = '_self',
  }) async {
    // Your platform-specific implementation
    // ...
  }

  @override
  Uri? getUri() {
    // Return current URI for web callback handling, or null for mobile
    return null;
  }
}
```

### Registering Your Implementation

To register your custom implementation as the default:

```dart
void registerWith(Registrar registrar) {
  VeriffFlutterPluginPlatformInterface.instance = MyCustomPlatformImplementation();
}
```

### Method Parameters

The `startVerification` method accepts the following parameters:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `sessionUrl` | `String` | Yes | The Veriff session URL to start verification |
| `branding` | `Branding?` | No | Custom branding configuration for the verification flow |
| `languageLocale` | `String?` | No | Language locale code (e.g., `'en'`, `'es'`, `'fr'`) |
| `useCustomIntroScreen` | `bool?` | No | Whether to use a custom introduction screen |
| `vendorData` | `String?` | No | Additional vendor-specific data |
| `webOnlyWindowName` | `String` | No | Window name for web platform (defaults to `'_self'`) |

### Return Value

The `startVerification` method returns a `Future<Result?>` where `Result` is from the `veriff_flutter` package, containing the verification outcome.

## Architecture

This package follows the [federated plugin pattern](https://docs.flutter.dev/packages-and-plugins/developing-packages#federated-plugins) recommended by Flutter:

```
┌─────────────────────────────────────────────────────────────┐
│                    veriff_flutter_plugin                     │
│                     (App-facing package)                     │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│          veriff_flutter_plugin_platform_interface           │
│                    (This package)                            │
│  ┌─────────────────────────────────────────────────────┐    │
│  │   VeriffFlutterPluginPlatformInterface (abstract)   │    │
│  │   VeriffFlutterPluginMethodChannel (default impl)   │    │
│  └─────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────┘
                              │
          ┌───────────────────┼───────────────────┐
          ▼                   ▼                   ▼
    ┌──────────┐        ┌──────────┐        ┌──────────┐
    │   iOS    │        │ Android  │        │   Web    │
    │  Plugin  │        │  Plugin  │        │  Plugin  │
    └──────────┘        └──────────┘        └──────────┘
```

1. **Abstract Interface**: `VeriffFlutterPluginPlatformInterface` defines the contract
2. **Default Implementation**: `VeriffFlutterPluginMethodChannel` provides a default method channel implementation
3. **Platform-Specific Implementations**: Each platform (iOS, Android, Web) can provide its own implementation

## Dependencies

| Package | Version | Description |
|---------|---------|-------------|
| `flutter` | SDK | Flutter framework |
| `plugin_platform_interface` | ^2.1.8 | Base package for platform interfaces |
| `veriff_flutter` | ^5.4.0 | Veriff Flutter SDK |

## Additional Information

This package is part of the Veriff Flutter plugin ecosystem. For more information:

- 📦 Main plugin package: [`veriff_flutter_plugin`](https://pub.dev/packages/veriff_flutter_plugin)
- 📖 [Veriff Developer Documentation](https://developers.veriff.com/)
- 🐛 [Report Issues](https://github.com/arthurmonteiroalvesmelo/veriff_flutter_plugin/issues)

## Contributing

Contributions are welcome! Please read our [contributing guidelines](https://github.com/arthurmonteiroalvesmelo/veriff_flutter_plugin/blob/main/CONTRIBUTING.md) before submitting a pull request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Made with ❤️ by [Arthur Monteiro](https://github.com/arthurmonteiroalvesmelo)
