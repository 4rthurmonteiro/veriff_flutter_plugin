import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:veriff_flutter/veriff_flutter.dart';
import 'package:veriff_flutter_plugin_platform_interface/src/method_channel/veriff_flutter_plugin_method_channel.dart';

/// The platform interface for the Veriff Flutter plugin.
///
/// This abstract class defines the contract that platform-specific
/// implementations must follow to provide Veriff identity verification
/// functionality.
///
/// Platform implementations should extend this class and override the
/// methods to provide platform-specific behavior.
abstract class VeriffFlutterPluginPlatformInterface extends PlatformInterface {
  /// Creates a new instance of [VeriffFlutterPluginPlatformInterface].
  VeriffFlutterPluginPlatformInterface() : super(token: _token);

  /// Creates a new instance using the current platform's delegate.
  ///
  /// Returns a platform-specific instance through [delegateFor].
  factory VeriffFlutterPluginPlatformInterface.instanceFor() =>
      VeriffFlutterPluginPlatformInterface.instance.delegateFor();

  static final Object _token = Object();

  static VeriffFlutterPluginPlatformInterface? _instance;

  /// The current default instance of [VeriffFlutterPluginPlatformInterface].
  ///
  /// Defaults to [VeriffFlutterPluginMethodChannel] if no custom instance
  /// has been set.
  static VeriffFlutterPluginPlatformInterface get instance =>
      _instance ??= VeriffFlutterPluginMethodChannel.instance;

  /// Sets the platform instance to use.
  ///
  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [VeriffFlutterPluginPlatformInterface] when they
  /// register themselves.
  static set instance(VeriffFlutterPluginPlatformInterface instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// Returns the platform-specific delegate instance.
  ///
  /// Platform implementations should override this method to return
  /// a new instance of their platform-specific implementation.
  ///
  /// Throws [UnimplementedError] if not overridden.
  VeriffFlutterPluginPlatformInterface delegateFor() {
    throw UnimplementedError('delegateFor() is not implemented');
  }

  /// Starts the Veriff identity verification flow.
  ///
  /// The [sessionUrl] is the URL provided by the Veriff API to initiate
  /// a verification session.
  ///
  /// Optional parameters:
  /// - [branding]: Custom branding configuration for the verification UI.
  /// - [languageLocale]: The locale code for the verification UI language.
  /// - [useCustomIntroScreen]: Whether to use a custom intro screen.
  /// - [vendorData]: Additional vendor-specific data to pass to Veriff.
  /// - [webOnlyWindowName]: Target window name for web platform. Use
  ///   `'_self'` (default) for the same window or `'_blank'` for a new
  ///   window.
  ///
  /// Returns a [Result] containing the verification outcome, or `null` if
  /// the result is not available (e.g., on web platform).
  ///
  /// Throws [UnimplementedError] if not overridden by a platform
  /// implementation.
  Future<Result?> startVerification(
    String sessionUrl, {
    Branding? branding,
    String? languageLocale,
    bool? useCustomIntroScreen,
    String? vendorData,
    String webOnlyWindowName = '_self',
  }) {
    throw UnimplementedError('startVerification() is not implemented');
  }

  /// Returns the current URI of the page.
  ///
  /// This is primarily used on web platforms to support callback URL
  /// handling after the verification flow completes.
  ///
  /// Returns `null` on non-web platforms or if the URI cannot be
  /// determined.
  ///
  /// Throws [UnimplementedError] if not overridden by a platform
  /// implementation.
  Uri? getUri() {
    throw UnimplementedError('getUri() is not implemented');
  }
}
