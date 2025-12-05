import 'package:veriff_flutter/veriff_flutter.dart';
import 'package:veriff_flutter_plugin_platform_interface/src/platform_interface/veriff_flutter_plugin_platform_interface.dart';

/// The method channel implementation of [VeriffFlutterPluginPlatformInterface].
///
/// This class uses the native Veriff SDK through method channels to provide
/// identity verification functionality on mobile platforms (iOS and Android).
class VeriffFlutterPluginMethodChannel
    extends VeriffFlutterPluginPlatformInterface {
  /// Creates a new instance of [VeriffFlutterPluginMethodChannel].
  VeriffFlutterPluginMethodChannel();

  static VeriffFlutterPluginMethodChannel? _instance;

  /// The singleton instance of [VeriffFlutterPluginMethodChannel].
  ///
  /// Creates a new instance if one does not already exist.
  static VeriffFlutterPluginMethodChannel get instance =>
      _instance ??= VeriffFlutterPluginMethodChannel();

  /// Starts the Veriff identity verification flow using the native SDK.
  ///
  /// Creates a [Configuration] with the provided parameters and launches
  /// the native Veriff verification UI.
  ///
  /// The [webOnlyWindowName] parameter is ignored on mobile platforms.
  ///
  /// Returns a [Result] containing the verification outcome.
  @override
  Future<Result?> startVerification(
    String sessionUrl, {
    Branding? branding,
    String? languageLocale,
    bool? useCustomIntroScreen,
    String? vendorData,
    String webOnlyWindowName = '_self',
  }) async {
    final veriff = Veriff();
    final config = Configuration(
      sessionUrl,
      branding: branding,
      languageLocale: languageLocale,
      useCustomIntroScreen: useCustomIntroScreen,
      vendorData: vendorData,
    );

    return veriff.start(config);
  }

  /// Returns the current URI.
  ///
  /// Always returns `null` on mobile platforms as URI-based callback
  /// handling is not applicable.
  @override
  Uri? getUri() => null;
}
