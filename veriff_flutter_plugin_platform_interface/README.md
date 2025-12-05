# veriff_flutter_plugin_platform_interface

A common platform interface for the Veriff Flutter plugin. This package provides the abstract platform interface that platform-specific implementations of the Veriff Flutter plugin must extend.

## Overview

This package defines the platform interface contract for the Veriff Flutter plugin, allowing different platform implementations (iOS, Android, Web) to provide their own specific implementations while maintaining a consistent API.

## Features

- **Platform Interface**: Abstract base class for Veriff Flutter plugin implementations
- **Method Channel Implementation**: Default implementation using method channels
- **Verification Support**: Start Veriff verification sessions with customizable options
- **Cross-Platform**: Works across iOS, Android, and Web platforms

## Getting Started

### Prerequisites

- Flutter SDK (>=1.17.0)
- Dart SDK (^3.10.3)

### Installation

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  veriff_flutter_plugin_platform_interface:
    path: ../veriff_flutter_plugin_platform_interface
```

Or if published to pub.dev:

```yaml
dependencies:
  veriff_flutter_plugin_platform_interface: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Usage

This package is typically used internally by platform-specific implementations of the Veriff Flutter plugin. However, if you're implementing a custom platform implementation, you would extend `VeriffFlutterPluginPlatformInterface`:

```dart
import 'package:veriff_flutter_plugin_platform_interface/veriff_flutter_plugin_platform_interface.dart';
import 'package:veriff_flutter/veriff_flutter.dart';

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
}
```

### Method Parameters

The `startVerification` method accepts the following parameters:

- **`sessionUrl`** (required): The Veriff session URL to start verification
- **`branding`** (optional): Custom branding configuration for the verification flow
- **`languageLocale`** (optional): Language locale code (e.g., 'en', 'es', 'fr')
- **`useCustomIntroScreen`** (optional): Whether to use a custom introduction screen
- **`vendorData`** (optional): Additional vendor-specific data
- **`webOnlyWindowName`** (optional): Window name for web platform (defaults to '_self', use '_blank' for new window)

### Return Value

The method returns a `Future<Result?>` where `Result` is from the `veriff_flutter` package, containing the verification result.

## Architecture

This package follows the platform interface pattern recommended by Flutter:

1. **Abstract Interface**: `VeriffFlutterPluginPlatformInterface` defines the contract
2. **Default Implementation**: `VeriffFlutterPluginMethodChannel` provides a default method channel implementation
3. **Platform-Specific Implementations**: Each platform (iOS, Android, Web) can provide its own implementation

## Dependencies

- `flutter`: Flutter SDK
- `plugin_platform_interface`: ^2.1.8 - Base package for platform interfaces
- `veriff_flutter`: ^5.4.0 - Veriff Flutter SDK

## Additional Information

This package is part of the Veriff Flutter plugin ecosystem. For more information:

- Check the main plugin package: `veriff_flutter_plugin`
- Visit [Veriff's documentation](https://developers.veriff.com/)
- See the example app in the `example` directory

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

See the LICENSE file for details.
