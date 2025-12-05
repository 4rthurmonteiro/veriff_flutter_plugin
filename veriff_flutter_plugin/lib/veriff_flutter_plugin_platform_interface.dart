import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'veriff_flutter_plugin_method_channel.dart';

abstract class VeriffFlutterPluginPlatform extends PlatformInterface {
  /// Constructs a VeriffFlutterPluginPlatform.
  VeriffFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static VeriffFlutterPluginPlatform _instance = MethodChannelVeriffFlutterPlugin();

  /// The default instance of [VeriffFlutterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelVeriffFlutterPlugin].
  static VeriffFlutterPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [VeriffFlutterPluginPlatform] when
  /// they register themselves.
  static set instance(VeriffFlutterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
