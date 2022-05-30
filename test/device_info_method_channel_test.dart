import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_info/device_info_method_channel.dart';

void main() {
  MethodChannelDeviceInfo platform = MethodChannelDeviceInfo();
  const MethodChannel channel = MethodChannel('device_info');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return Future.value(null);
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getAndroidDeviceInfo(), null);
  });
}
