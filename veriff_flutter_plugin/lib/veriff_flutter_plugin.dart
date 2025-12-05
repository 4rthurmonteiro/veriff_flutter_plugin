import 'package:veriff_flutter_plugin_platform_interface/veriff_flutter_plugin_platform_interface.dart';

/// A Flutter plugin for integrating Veriff identity verification.
///
/// This class provides a high-level API to start and manage Veriff
/// verification sessions in Flutter applications.
///
/// Use the [instance] getter to access the singleton instance of this plugin.
///
/// Example usage:
/// ```dart
/// final result = await VeriffFlutterPlugin.instance.startVerification(sessionUrl);
/// ```
class VeriffFlutterPlugin {
  /// Private constructor to enforce the singleton pattern.
  const VeriffFlutterPlugin._();

  /// Returns the singleton instance of [VeriffFlutterPlugin].
  static VeriffFlutterPlugin get instance => VeriffFlutterPlugin._();

  VeriffFlutterPluginPlatformInterface get _delegate {
    return VeriffFlutterPluginPlatformInterface.instance.delegateFor();
  }

  /// Starts a Veriff identity verification session.
  ///
  /// Takes the [sessionUrl] provided by the Veriff backend to initialize
  /// the verification flow.
  ///
  /// Returns a [Result] containing the verification outcome, or `null`
  /// if the verification was cancelled or failed to start.
  Future<Result?> startVerification(String sessionUrl) =>
      _delegate.startVerification(sessionUrl);

  /// Retrieves the URI associated with the current verification session.
  ///
  /// Returns the [Uri] if available, or `null` if no session is active.
  Uri? getUri() => _delegate.getUri();
}
