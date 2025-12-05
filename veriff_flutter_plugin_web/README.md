# veriff_flutter_plugin_web

Web platform implementation for the Veriff Flutter plugin. This package provides the web-specific implementation that enables Veriff identity verification to work in Flutter web applications.

## Overview

This package is the web platform implementation of the Veriff Flutter plugin. It extends the platform interface and provides web-specific functionality for launching Veriff verification sessions in a browser environment.

## Features

- **Web Platform Support**: Native web implementation for Veriff verification
- **URL Launching**: Opens Veriff session URLs in the browser using `url_launcher`
- **Language Localization**: Supports language locale configuration via URL query parameters
- **Window Management**: Configurable window behavior (same window or new window)
- **Platform Interface**: Implements the standard Veriff Flutter plugin platform interface

## Getting Started

### Prerequisites

- Flutter SDK (>=1.20.0)
- Dart SDK (^3.10.3)
- Flutter web support enabled

### Installation

This package is typically included automatically when you add the main `veriff_flutter_plugin` package to your project. However, if you need to add it directly:

```yaml
dependencies:
  veriff_flutter_plugin_web:
    path: ../veriff_flutter_plugin_web
```

Or if published to pub.dev:

```yaml
dependencies:
  veriff_flutter_plugin_web: ^1.0.0
```

Then run:

```bash
flutter pub get
```

### Web Setup

Ensure your Flutter web app is properly configured. The plugin will automatically register itself when the web platform is used.

## Usage

This package is used automatically by the main `veriff_flutter_plugin` package when running on web. You typically don't need to interact with this package directly, but if you're using the platform interface directly:

```dart
import 'package:veriff_flutter_plugin_platform_interface/veriff_flutter_plugin_platform_interface.dart';

// The web implementation is automatically registered
final result = await VeriffFlutterPluginPlatformInterface.instance.startVerification(
  'https://station.veriff.com/v/your-session-url',
  languageLocale: 'en',
  webOnlyWindowName: '_self', // or '_blank' for new window
);
```

### Parameters

The `startVerification` method accepts the following parameters:

- **`sessionUrl`** (required): The Veriff session URL to start verification
- **`branding`** (optional): Custom branding configuration (note: may have limited support on web)
- **`languageLocale`** (optional): Language locale code (e.g., 'en', 'es', 'fr'). This is added as a query parameter to the URL
- **`useCustomIntroScreen`** (optional): Whether to use a custom introduction screen (may have limited support on web)
- **`vendorData`** (optional): Additional vendor-specific data (may have limited support on web)
- **`webOnlyWindowName`** (optional): Window name for web platform
  - `'_self'` (default): Opens in the same window/tab
  - `'_blank'`: Opens in a new window/tab

### Web-Specific Behavior

On web, the verification flow works by:

1. Opening the Veriff session URL in the browser
2. Appending the language locale as a query parameter if provided
3. The user completes verification in the browser
4. The result is handled by Veriff's web flow (typically via redirects or callbacks)

**Note**: Unlike native platforms, the web implementation returns `null` for the result, as the verification flow is handled entirely within the browser and redirects to your configured callback URLs.

### Handling Callback URLs

After the verification flow completes, Veriff redirects back to your application with the result in the URL. You can use the `getUri()` method to retrieve the current browser URL and extract the verification result:

```dart
import 'package:veriff_flutter_plugin_platform_interface/veriff_flutter_plugin_platform_interface.dart';

// Get the current browser URL after redirect
final uri = VeriffFlutterPluginPlatformInterface.instance.getUri();
if (uri != null) {
  // Parse query parameters for verification status
  final status = uri.queryParameters['status'];
  final sessionId = uri.queryParameters['sessionId'];
}
```

## Implementation Details

### URL Handling

The web implementation uses the `url_launcher` package to open Veriff session URLs. The language locale is automatically appended as a query parameter:

```dart
// If languageLocale is 'en', the URL becomes:
// https://station.veriff.com/v/session-url?lang=en
```

### Window Management

You can control whether the verification opens in the same window or a new window using the `webOnlyWindowName` parameter:

- **Same Window** (`'_self'`): The current page navigates to the Veriff session. The user will need to navigate back after verification.
- **New Window** (`'_blank'`): Opens the verification in a new browser tab/window, keeping your app open in the original tab.

## Dependencies

- `flutter`: Flutter SDK
- `flutter_web_plugins`: Flutter web plugins support
- `url_launcher`: ^6.3.2 - For launching URLs in the browser
- `veriff_flutter_plugin_platform_interface`: ^1.0.0 - Platform interface package
- `web`: ^1.1.1 - Web platform support

## Platform Registration

The plugin automatically registers itself when running on web:

```dart
static void registerWith(Registrar registrar) {
  VeriffFlutterPluginPlatformInterface.instance = VeriffFlutterPluginWeb();
}
```

This registration happens automatically when the plugin is loaded, so you don't need to manually register it.

## Limitations

- **Result Handling**: The web implementation may return `null` as results are typically handled via redirects or callbacks configured in your Veriff dashboard
- **Branding**: Some branding options may have limited support compared to native platforms
- **Custom Screens**: Custom intro screens may not be fully supported on web

## Additional Information

This package is part of the Veriff Flutter plugin ecosystem:

- Main plugin: `veriff_flutter_plugin`
- Platform interface: `veriff_flutter_plugin_platform_interface`
- Visit [Veriff's documentation](https://developers.veriff.com/) for more information about Veriff integration
- See the example app in the main plugin's `example` directory

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

See the LICENSE file for details.
