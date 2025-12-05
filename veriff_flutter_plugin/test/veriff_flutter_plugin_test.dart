import 'package:flutter_test/flutter_test.dart';
import 'package:veriff_flutter_plugin/veriff_flutter_plugin.dart';
import 'package:veriff_flutter_plugin/veriff_flutter_plugin_platform_interface.dart';
import 'package:veriff_flutter_plugin/veriff_flutter_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockVeriffFlutterPluginPlatform
    with MockPlatformInterfaceMixin
    implements VeriffFlutterPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final VeriffFlutterPluginPlatform initialPlatform = VeriffFlutterPluginPlatform.instance;

  test('$MethodChannelVeriffFlutterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelVeriffFlutterPlugin>());
  });

  test('getPlatformVersion', () async {
    VeriffFlutterPlugin veriffFlutterPlugin = VeriffFlutterPlugin();
    MockVeriffFlutterPluginPlatform fakePlatform = MockVeriffFlutterPluginPlatform();
    VeriffFlutterPluginPlatform.instance = fakePlatform;

    expect(await veriffFlutterPlugin.getPlatformVersion(), '42');
  });
}
