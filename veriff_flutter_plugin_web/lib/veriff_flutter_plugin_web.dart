import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:veriff_flutter_plugin_platform_interface/veriff_flutter_plugin_platform_interface.dart';
import 'package:web/web.dart';

/// The web implementation of [VeriffFlutterPluginPlatformInterface].
///
/// This class provides Veriff identity verification functionality for
/// Flutter Web by redirecting users to the Veriff verification URL.
class VeriffFlutterPluginWeb extends VeriffFlutterPluginPlatformInterface {
  /// Returns a new instance of [VeriffFlutterPluginWeb] as the platform delegate.
  @override
  VeriffFlutterPluginPlatformInterface delegateFor() =>
      VeriffFlutterPluginWeb();

  /// Starts the Veriff identity verification flow on web.
  ///
  /// Navigates the user to the Veriff verification URL with the specified
  /// language locale appended as a query parameter.
  ///
  /// The [webOnlyWindowName] parameter controls how the URL is opened:
  /// - `'_self'` (default): Opens in the current window/tab.
  /// - `'_blank'`: Opens in a new window/tab.
  ///
  /// Note: On web, the [branding], [useCustomIntroScreen], and [vendorData]
  /// parameters are not used as the verification happens on the Veriff website.
  ///
  /// Always returns `null` as the verification result is handled through
  /// callback URLs on web platforms.
  @override
  Future<Result?> startVerification(
    String sessionUrl, {
    Branding? branding,
    String? languageLocale,
    bool? useCustomIntroScreen,
    String? vendorData,
    String webOnlyWindowName = '_self',
  }) async {
    final uri = Uri.parse(sessionUrl);
    final uriWithLang = uri.replace(
      queryParameters: {...uri.queryParameters, 'lang': languageLocale},
    );
    await launchUrl(uriWithLang, webOnlyWindowName: webOnlyWindowName);

    return null;
  }

  /// Returns the current browser URL as a [Uri].
  ///
  /// This is useful for handling callback URLs after the Veriff verification
  /// flow redirects back to the application. The returned URI can be parsed
  /// to extract verification status or session information from query parameters.
  ///
  /// Returns `null` if the URL cannot be parsed.
  @override
  Uri? getUri() {
    return Uri.tryParse(window.location.href);
  }

  /// Registers this plugin with the Flutter Web plugin registry.
  ///
  /// Called automatically by Flutter during plugin initialization.
  /// Sets [VeriffFlutterPluginWeb] as the platform instance for web.
  static void registerWith(Registrar registrar) {
    VeriffFlutterPluginPlatformInterface.instance = VeriffFlutterPluginWeb();
  }
}
