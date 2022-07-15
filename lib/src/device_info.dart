import 'package:device_info_x/models/android.dart';
import 'package:device_info_x/models/android_device_info.dart';
import 'package:device_info_x/models/battery.dart';
import 'package:device_info_x/models/camera.dart';
import 'package:device_info_x/models/cpu_info.dart';
import 'package:device_info_x/models/display.dart';
import 'package:device_info_x/models/drm_info.dart';
import 'package:device_info_x/models/memory.dart';
import 'package:device_info_x/models/network.dart';
import 'package:device_info_x/models/sim_info.dart';
import 'package:device_info_x/models/system_files.dart';
import 'package:device_info_x/models/system_info.dart';
import 'package:device_info_x/models/thermal.dart';

import 'device_info_platform_interface.dart';

class DeviceInfo {
  /// [DeviceInfo] is a singleton class that provides access to the device info.
  Future<AndroidDeviceInfo?> getAndroidDeviceInfo() {
    return DeviceInfoPlatform.instance.getAndroidDeviceInfo();
  }

  Future<Android?> getAndroid() {
    return DeviceInfoPlatform.instance.getAndroid();
  }

  Future<Battery?> getBattery() {
    return DeviceInfoPlatform.instance.getBattery();
  }

  Future<CameraInfos?> getCameras() {
    return DeviceInfoPlatform.instance.getCameras();
  }

  Future<CPUInfo?> getCPUInfo() {
    return DeviceInfoPlatform.instance.getCPUInfo();
  }

  Future<Display?> getDisplayInfo() {
    return DeviceInfoPlatform.instance.getDisplayInfo();
  }

  Future<DRMINFO?> getDRMInfo() {
    return DeviceInfoPlatform.instance.getDRMInfo();
  }

  Future<Memory?> getMemoryInfo() {
    return DeviceInfoPlatform.instance.getMemoryInfo();
  }

  Future<Network?> getNetworkInfo() {
    return DeviceInfoPlatform.instance.getNetworkInfo();
  }

  Future<SimInfo?> getSimInfo() {
    return DeviceInfoPlatform.instance.getSimInfo();
  }

  Future<SystemFiles?> getSystemFiles() {
    return DeviceInfoPlatform.instance.getSystemFiles();
  }

  Future<SystemInfo?> getSystemInfo() {
    return DeviceInfoPlatform.instance.getSystemInfo();
  }

  Future<Thermal?> getThermalInfo() {
    return DeviceInfoPlatform.instance.getThermalInfo();
  }
}
