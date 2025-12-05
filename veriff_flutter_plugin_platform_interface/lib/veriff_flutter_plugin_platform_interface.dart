/// The platform interface for the Veriff Flutter plugin.
///
/// This library provides the abstract platform interface that
/// platform-specific implementations of the Veriff Flutter plugin
/// must extend. It also re-exports the `veriff_flutter` package
/// for convenience.
///
/// ## Usage
///
/// Import this library in your platform-specific implementation:
///
/// ```dart
/// import 'package:veriff_flutter_plugin_platform_interface/veriff_flutter_plugin_platform_interface.dart';
///
/// class MyPlatformImplementation
///     extends VeriffFlutterPluginPlatformInterface {
///   // Your implementation here
/// }
/// ```
library;

export 'package:veriff_flutter/veriff_flutter.dart';
export 'src/platform_interface/veriff_flutter_plugin_platform_interface.dart';
