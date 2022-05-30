
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
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_info_platform_interface.dart';

/// An implementation of [DeviceInfoPlatform] that uses method channels.
class MethodChannelDeviceInfo extends DeviceInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_info');

  @override
  Future<AndroidDeviceInfo?> getAndroidDeviceInfo() async {
    final result =
        await methodChannel.invokeMethod<String>('androidDeviceInfo');
    return result == null ? null : AndroidDeviceInfo.fromJson(result);
  }

  @override
  Future<Android?> getAndroid() async {
    final result = await methodChannel.invokeMethod<String>('androidInfo');
    return result == null ? null : Android.fromJson(result);
  }

  @override
  Future<Battery?> getBattery() async {
    final result = await methodChannel.invokeMethod<String>('batteryInfo');
    return result == null ? null : Battery.fromJson(result);
  }

  @override
  Future<CameraInfos?> getCameras() async {
    final result = await methodChannel.invokeMethod<String>('cameraInfo');
    return result == null ? null : CameraInfos.fromJson(result);
  }

  @override
  Future<CPUInfo?> getCPUInfo() async {
    final result = await methodChannel.invokeMethod<String>('cpuInfo');
    return result == null ? null : CPUInfo.fromJson(result);
  }

  @override
  Future<Display?> getDisplayInfo() async {
    final result = await methodChannel.invokeMethod<String>('displayInfo');
    return result == null ? null : Display.fromJson(result);
  }

  @override
  Future<DRMINFO?> getDRMInfo() async {
    final result = await methodChannel.invokeMethod<String>('drmInfo');
    return result == null ? null : DRMINFO.fromJson(result);
  }

  @override
  Future<Memory?> getMemoryInfo() async {
    final result = await methodChannel.invokeMethod<String>('memoryInfo');
    return result == null ? null : Memory.fromJson(result);
  }

  @override
  Future<Network?> getNetworkInfo() async {
    final result = await methodChannel.invokeMethod<String>('networkInfo');
    return result == null ? null : Network.fromJson(result);
  }

  @override
  Future<SimInfo?> getSimInfo() async {
    final result = await methodChannel.invokeMethod<String>('simInfo');
    return result == null ? null : SimInfo.fromJson(result);
  }

  @override
  Future<SystemFiles?> getSystemFiles() async {
    final result = await methodChannel.invokeMethod<String>('systemFiles');
    return result == null ? null : SystemFiles.fromJson(result);
  }

  @override
  Future<SystemInfo?> getSystemInfo() async {
    final result = await methodChannel.invokeMethod<String>('systemInfo');
    return result == null ? null : SystemInfo.fromJson(result);
  }

  @override
  Future<Thermal?> getThermalInfo() async {
    final result = await methodChannel.invokeMethod<String>('thermal');
    return result == null ? null : Thermal.fromJson(result);
  }
}
