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

class DeviceInfoX {
  /// [DeviceInfoX] is a singleton class that provides access to the device info.
  Future<AndroidDeviceInfo?> getAndroidDeviceInfo() {
    return DeviceInfoPlatform.instance.getAndroidDeviceInfo();
  }
  /// returns the [Android] object else null.
  Future<Android?> getAndroid() {
    return DeviceInfoPlatform.instance.getAndroid();
  }
  /// returns the [Battery] object else null.
  Future<Battery?> getBattery() {
    return DeviceInfoPlatform.instance.getBattery();
  }
  /// returns the [CameraInfos] object else null.
  Future<CameraInfos?> getCameras() {
    return DeviceInfoPlatform.instance.getCameras();
  }
  /// returns the [CPUInfo] object else null.
  Future<CPUInfo?> getCPUInfo() {
    return DeviceInfoPlatform.instance.getCPUInfo();
  }
  /// returns the [Display] object else null.
  Future<Display?> getDisplayInfo() {
    return DeviceInfoPlatform.instance.getDisplayInfo();
  }
  /// returns the [DRMINFO] object else null.
  Future<DRMINFO?> getDRMInfo() {
    return DeviceInfoPlatform.instance.getDRMInfo();
  }
  /// returns the [Memory] object else null.
  Future<Memory?> getMemoryInfo() {
    return DeviceInfoPlatform.instance.getMemoryInfo();
  }
  /// returns the [Network] object else null.
  Future<Network?> getNetworkInfo() {
    return DeviceInfoPlatform.instance.getNetworkInfo();
  }
  /// returns the [SimInfo] object else null.
  Future<SimInfo?> getSimInfo() {
    return DeviceInfoPlatform.instance.getSimInfo();
  }
  /// returns the [SystemFiles] object else null.
  Future<SystemFiles?> getSystemFiles() {
    return DeviceInfoPlatform.instance.getSystemFiles();
  }
  /// returns the [SystemInfo] object else null.
  Future<SystemInfo?> getSystemInfo() {
    return DeviceInfoPlatform.instance.getSystemInfo();
  }
  /// returns the [Thermal] object else null.
  Future<Thermal?> getThermalInfo() {
    return DeviceInfoPlatform.instance.getThermalInfo();
  }
}
