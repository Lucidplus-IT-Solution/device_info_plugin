import 'package:device_info/models/android.dart';
import 'package:device_info/models/android_device_info.dart';
import 'package:device_info/models/battery.dart';
import 'package:device_info/models/camera.dart';
import 'package:device_info/models/cpu_info.dart';
import 'package:device_info/models/display.dart';
import 'package:device_info/models/drm_info.dart';
import 'package:device_info/models/memory.dart';
import 'package:device_info/models/network.dart';
import 'package:device_info/models/sim_info.dart';
import 'package:device_info/models/system_files.dart';
import 'package:device_info/models/system_info.dart';
import 'package:device_info/models/thermal.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_info_method_channel.dart';

abstract class DeviceInfoPlatform extends PlatformInterface {
  /// Constructs a DeviceInfoPlatform.
  DeviceInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceInfoPlatform _instance = MethodChannelDeviceInfo();

  /// The default instance of [DeviceInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceInfo].
  static DeviceInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DeviceInfoPlatform] when
  /// they register themselves.
  static set instance(DeviceInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<AndroidDeviceInfo?> getAndroidDeviceInfo() {
    throw UnimplementedError(
        'getandroidDeviceInfo() has not been implemented.');
  }

  Future<Android?> getAndroid() {
    throw UnimplementedError('getAndroid() has not been implemented.');
  }

  Future<Battery?> getBattery() {
    throw UnimplementedError('getBattery() has not been implemented.');
  }

  Future<CameraInfos?> getCameras() {
    throw UnimplementedError('getCameras() has not been implemented.');
  }

  Future<CPUInfo?> getCPUInfo() {
    throw UnimplementedError('getCPUInfo() has not been implemented.');
  }

  Future<Display?> getDisplayInfo() {
    throw UnimplementedError('getDisplayInfo() has not been implemented.');
  }

  Future<DRMINFO?> getDRMInfo() {
    throw UnimplementedError('getDRMInfo() has not been implemented.');
  }

  Future<Memory?> getMemoryInfo() {
    throw UnimplementedError('getMemoryInfo() has not been implemented.');
  }

  Future<Network?> getNetworkInfo() {
    throw UnimplementedError('getNetworkInfo() has not been implemented.');
  }

  Future<SimInfo?> getSimInfo() {
    throw UnimplementedError('getSimInfo() has not been implemented.');
  }

  Future<SystemFiles?> getSystemFiles() {
    throw UnimplementedError('getSystemFiles() has not been implemented.');
  }

  Future<SystemInfo?> getSystemInfo() {
    throw UnimplementedError('getSystemInfo() has not been implemented.');
  }

  Future<Thermal?> getThermalInfo() {
    throw UnimplementedError('getThermalInfo() has not been implemented.');
  }
}
