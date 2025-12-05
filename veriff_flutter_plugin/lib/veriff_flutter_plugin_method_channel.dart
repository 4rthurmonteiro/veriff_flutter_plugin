import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'veriff_flutter_plugin_platform_interface.dart';

/// An implementation of [VeriffFlutterPluginPlatform] that uses method channels.
class MethodChannelVeriffFlutterPlugin extends VeriffFlutterPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('veriff_flutter_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
