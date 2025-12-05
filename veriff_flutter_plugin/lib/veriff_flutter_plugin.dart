
import 'veriff_flutter_plugin_platform_interface.dart';

class VeriffFlutterPlugin {
  Future<String?> getPlatformVersion() {
    return VeriffFlutterPluginPlatform.instance.getPlatformVersion();
  }
}
