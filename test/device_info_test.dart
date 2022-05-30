import 'package:device_info/models/android.dart';
import 'package:device_info/models/android_device_info.dart';
import 'package:device_info/models/thermal.dart';
import 'package:device_info/models/system_info.dart';
import 'package:device_info/models/system_files.dart';
import 'package:device_info/models/sim_info.dart';
import 'package:device_info/models/network.dart';
import 'package:device_info/models/memory.dart';
import 'package:device_info/models/drm_info.dart';
import 'package:device_info/models/display.dart';
import 'package:device_info/models/cpu_info.dart';
import 'package:device_info/models/camera.dart';
import 'package:device_info/models/battery.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_info/device_info.dart';
import 'package:device_info/device_info_platform_interface.dart';
import 'package:device_info/device_info_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDeviceInfoPlatform
    with MockPlatformInterfaceMixin
    implements DeviceInfoPlatform {
  @override
  Future<AndroidDeviceInfo?> getAndroidDeviceInfo() =>
      Future.value(AndroidDeviceInfo());

  @override
  Future<Android?> getAndroid() => Future.value(Android());

  @override
  Future<Battery?> getBattery() => Future.value(Battery());

  @override
  Future<CPUInfo?> getCPUInfo() => Future.value(CPUInfo());

  @override
  Future<CameraInfos?> getCameras() => Future.value(CameraInfos(cameras: [
        Cameras(
            name: "0",
            resolution: "1920x1080",
            videoResolution: "1920x1080",
            orientation: "0",
            focalLength: "0",
            focusModes: ["0"],
            videoSnapshotSupported: true,
            videoStabilizationSupported: true,
            zoomSupported: true,
            smoothZoomSupported: false,
            autoExposureLockingSupported: true,
            autoWhiteBalanceLockingSupported: true,
            flashSupported: true),
      ]));

  @override
  Future<DRMINFO?> getDRMInfo() => Future.value(DRMINFO(
        vendor: "google",
        version: "0.0.0",
        description: "Widevine",
        algorithms: "AES/CTR/CBC/NoPadding",
        systemId: "0",
        securityLevel: "L3",
        hdcpLevel: "HDCP_LEVEL_3_PARTIAL",
        maxHdcpLevel: "HDCP_LEVEL_3_PARTIAL",
        usageRepostingSupport: "true",
        maxNoOfSessions: "1",
        noOfOpenSessions: "0",
      ));

  @override
  Future<Display?> getDisplayInfo() => Future.value(Display(
        resolution: "1920x1080",
        density: "1.0",
        screenSize: "4.0",
        refreshRate: "60.0",
        hdrCapabilities: "HDR_CAPABILITIES_NONE",
        brightnessLevel: "0",
        screenTimeout: "0",
        orientation: "Portrait",
      ));

  @override
  Future<Memory?> getMemoryInfo() => Future.value(
        Memory(
          ram: MemoryTypeInfo(
            name: "ram",
            used: "0",
            free: "0",
            total: "0",
          ),
          internal: MemoryTypeInfo(
            name: "internal",
            used: "0",
            free: "0",
            total: "0",
          ),
          external: MemoryTypeInfo(
            name: "external",
            used: "0",
            free: "0",
            total: "0",
          ),
        ),
      );

  @override
  Future<Network?> getNetworkInfo() => Future.value(Network());

  @override
  Future<SimInfo?> getSimInfo() => Future.value(SimInfo(sims: []));

  @override
  Future<SystemFiles?> getSystemFiles() => Future.value(SystemFiles(
        cpuInfo: SystemType(name: "cpu", path: "cpu"),
        hosts: SystemType(name: "hosts", path: "hosts"),
        memoryInfo: SystemType(name: "memory", path: "memory"),
      ));
  @override
  Future<SystemInfo?> getSystemInfo() => Future.value(null);

  @override
  Future<Thermal?> getThermalInfo() => Future.value(null);
}

void main() {
  final DeviceInfoPlatform initialPlatform = DeviceInfoPlatform.instance;

  test('$MethodChannelDeviceInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDeviceInfo>());
  });

  test('getAndroidDeviceInfo', () async {
    DeviceInfo deviceInfoPlugin = DeviceInfo();
    MockDeviceInfoPlatform fakePlatform = MockDeviceInfoPlatform();
    DeviceInfoPlatform.instance = fakePlatform;
    expect(await deviceInfoPlugin.getAndroidDeviceInfo(), AndroidDeviceInfo());
  });
  test('getAndroidInfo', () async {
    DeviceInfo deviceInfoPlugin = DeviceInfo();
    MockDeviceInfoPlatform fakePlatform = MockDeviceInfoPlatform();
    DeviceInfoPlatform.instance = fakePlatform;
    expect(await deviceInfoPlugin.getAndroid(), Android());
  });
  test('getBatteryInfo', () async {
    DeviceInfo deviceInfoPlugin = DeviceInfo();
    MockDeviceInfoPlatform fakePlatform = MockDeviceInfoPlatform();
    DeviceInfoPlatform.instance = fakePlatform;
    expect(await deviceInfoPlugin.getBattery(), Battery());
  });
  test('getCPUInfo', () async {
    DeviceInfo deviceInfoPlugin = DeviceInfo();
    MockDeviceInfoPlatform fakePlatform = MockDeviceInfoPlatform();
    DeviceInfoPlatform.instance = fakePlatform;
    expect(await deviceInfoPlugin.getCPUInfo(), CPUInfo());
  });
  test('getCameras', () async {
    DeviceInfo deviceInfoPlugin = DeviceInfo();
    MockDeviceInfoPlatform fakePlatform = MockDeviceInfoPlatform();
    DeviceInfoPlatform.instance = fakePlatform;
    expect(
        await deviceInfoPlugin.getCameras(),
        CameraInfos(cameras: [
          Cameras(
              name: "0",
              resolution: "1920x1080",
              videoResolution: "1920x1080",
              orientation: "0",
              focalLength: "0",
              focusModes: ["0"],
              videoSnapshotSupported: true,
              videoStabilizationSupported: true,
              zoomSupported: true,
              smoothZoomSupported: false,
              autoExposureLockingSupported: true,
              autoWhiteBalanceLockingSupported: true,
              flashSupported: true),
        ]));
  });
  test('getDRMInfo', () async {
    DeviceInfo deviceInfoPlugin = DeviceInfo();
    MockDeviceInfoPlatform fakePlatform = MockDeviceInfoPlatform();
    DeviceInfoPlatform.instance = fakePlatform;
    expect(
        await deviceInfoPlugin.getDRMInfo(),
        DRMINFO(
          vendor: "google",
          version: "0.0.0",
          description: "Widevine",
          algorithms: "AES/CTR/CBC/NoPadding",
          systemId: "0",
          securityLevel: "L3",
          hdcpLevel: "HDCP_LEVEL_3_PARTIAL",
          maxHdcpLevel: "HDCP_LEVEL_3_PARTIAL",
          usageRepostingSupport: "true",
          maxNoOfSessions: "1",
          noOfOpenSessions: "0",
        ));
  });
  test('getDisplayInfo', () async {
    DeviceInfo deviceInfoPlugin = DeviceInfo();
    MockDeviceInfoPlatform fakePlatform = MockDeviceInfoPlatform();
    DeviceInfoPlatform.instance = fakePlatform;
    expect(
        await deviceInfoPlugin.getDisplayInfo(),
        Display(
          resolution: "1920x1080",
          density: "1.0",
          screenSize: "4.0",
          refreshRate: "60.0",
          hdrCapabilities: "HDR_CAPABILITIES_NONE",
          brightnessLevel: "0",
          screenTimeout: "0",
          orientation: "Portrait",
        ));
  });
  test('getMemoryInfo', () async {
    DeviceInfo deviceInfoPlugin = DeviceInfo();
    MockDeviceInfoPlatform fakePlatform = MockDeviceInfoPlatform();
    DeviceInfoPlatform.instance = fakePlatform;
    expect(
        await deviceInfoPlugin.getMemoryInfo(),
        Memory(
          ram: MemoryTypeInfo(
            name: "ram",
            used: "0",
            free: "0",
            total: "0",
          ),
          internal: MemoryTypeInfo(
            name: "internal",
            used: "0",
            free: "0",
            total: "0",
          ),
          external: MemoryTypeInfo(
            name: "external",
            used: "0",
            free: "0",
            total: "0",
          ),
        ));
  });
  test('getNetworkInfo', () async {
    DeviceInfo deviceInfoPlugin = DeviceInfo();
    MockDeviceInfoPlatform fakePlatform = MockDeviceInfoPlatform();
    DeviceInfoPlatform.instance = fakePlatform;
    expect(await deviceInfoPlugin.getNetworkInfo(), Network());
  });
  test('getSimInfo', () async {
    DeviceInfo deviceInfoPlugin = DeviceInfo();
    MockDeviceInfoPlatform fakePlatform = MockDeviceInfoPlatform();
    DeviceInfoPlatform.instance = fakePlatform;
    expect(await deviceInfoPlugin.getSimInfo(), SimInfo(sims: []));
  });
  test('getSystemFiles', () async {
    DeviceInfo deviceInfoPlugin = DeviceInfo();
    MockDeviceInfoPlatform fakePlatform = MockDeviceInfoPlatform();
    DeviceInfoPlatform.instance = fakePlatform;
    expect(
        await deviceInfoPlugin.getSystemFiles(),
        SystemFiles(
          cpuInfo: SystemType(name: "cpu", path: "cpu"),
          hosts: SystemType(name: "hosts", path: "hosts"),
          memoryInfo: SystemType(name: "memory", path: "memory"),
        ));
  });
  test('getSystemInfo', () async {
    DeviceInfo deviceInfoPlugin = DeviceInfo();
    MockDeviceInfoPlatform fakePlatform = MockDeviceInfoPlatform();
    DeviceInfoPlatform.instance = fakePlatform;
    expect(await deviceInfoPlugin.getSystemInfo(), null);
  });
  test('getThermalInfo', () async {
    DeviceInfo deviceInfoPlugin = DeviceInfo();
    MockDeviceInfoPlatform fakePlatform = MockDeviceInfoPlatform();
    DeviceInfoPlatform.instance = fakePlatform;
    expect(await deviceInfoPlugin.getThermalInfo(), null);
  });
  
}
