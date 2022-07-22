import 'dart:convert';

import 'android.dart';
import 'battery.dart';
import 'camera.dart';
import 'cpu_info.dart';
import 'display.dart';
import 'drm_info.dart';
import 'package:device_info_x/models/memory.dart';
import 'sim_info.dart';
import 'system_info.dart';
import 'thermal.dart';

import 'network.dart';
import 'system_files.dart';

/// [AndroidDeviceInfo] is the class for android device information.
class AndroidDeviceInfo {
  /// [system] is the system information of the android device.
  SystemInfo? system;

  /// [cpu] is the cpu information of the android device.
  CPUInfo? cpu;

  /// [android] is the android information of the android device.
  Android? android;

  /// [drmInfo] is the drm information of the android device.
  DRMINFO? drmInfo;

  /// [memory] is the memory information of the android device.
  Memory? memory;

  /// [camera] is the camera information of the android device.
  CameraInfos? camera;

  /// [battery] is the battery information of the android device.
  Battery? battery;

  /// [display] is the display information of the android device.
  Display? display;

  /// [thermal] is the thermal information of the android device.
  Thermal? thermal;

  /// [network] is the network information of the android device.
  Network? network;

  /// [simInfo] is the sim information of the android device.
  SimInfo? simInfo;

  /// [systemFile] is the system files information of the android device.
  SystemFiles? systemFile;

  /// This is the constructor for the class.
  AndroidDeviceInfo({
    this.system,
    this.cpu,
    this.android,
    this.drmInfo,
    this.memory,
    this.camera,
    this.battery,
    this.display,
    this.thermal,
    this.network,
    this.simInfo,
    this.systemFile,
  });

  /// [copyWith] is the function to copy the class.
  AndroidDeviceInfo copyWith({
    SystemInfo? system,
    CPUInfo? cpu,
    Android? android,
    DRMINFO? drmInfo,
    Memory? memory,
    CameraInfos? camera,
    Battery? battery,
    Display? display,
    Thermal? thermal,
    Network? network,
    SimInfo? simInfo,
    SystemFiles? systemFile,
  }) {
    return AndroidDeviceInfo(
      system: system ?? this.system,
      cpu: cpu ?? this.cpu,
      android: android ?? this.android,
      drmInfo: drmInfo ?? this.drmInfo,
      memory: memory ?? this.memory,
      camera: camera ?? this.camera,
      battery: battery ?? this.battery,
      display: display ?? this.display,
      thermal: thermal ?? this.thermal,
      network: network ?? this.network,
      simInfo: simInfo ?? this.simInfo,
      systemFile: systemFile ?? this.systemFile,
    );
  }

  /// [toMap] is the method to convert the android device information to map.
  Map<String, dynamic> toMap() {
    return {
      'system': system?.toMap(),
      'cpu': cpu?.toMap(),
      'android': android?.toMap(),
      'drmInfo': drmInfo?.toMap(),
      'memory': memory?.toMap(),
      'camera': camera?.toMap(),
      'battery': battery?.toMap(),
      'display': display?.toMap(),
      'thermal': thermal?.toMap(),
      'network': network?.toMap(),
      'simInfo': simInfo?.toMap(),
      'systemFile': systemFile?.toMap(),
    };
  }

  /// [fromMap] is the method to convert the map to the android device information.
  factory AndroidDeviceInfo.fromMap(Map<String, dynamic> map) {
    return AndroidDeviceInfo(
      system: map['system'] != null ? SystemInfo.fromMap(map['system']) : null,
      cpu: map['cpu'] != null ? CPUInfo.fromMap(map['cpu']) : null,
      android: map['android'] != null ? Android.fromMap(map['android']) : null,
      drmInfo: map['drmInfo'] != null ? DRMINFO.fromMap(map['drmInfo']) : null,
      memory: map['memory'] != null ? Memory.fromMap(map['memory']) : null,
      camera: map['camera'] != null ? CameraInfos.fromMap(map['camera']) : null,
      battery: map['battery'] != null ? Battery.fromMap(map['battery']) : null,
      display: map['display'] != null ? Display.fromMap(map['display']) : null,
      thermal: map['thermal'] != null ? Thermal.fromMap(map['thermal']) : null,
      network: map['network'] != null ? Network.fromMap(map['network']) : null,
      simInfo: map['simInfo'] != null ? SimInfo.fromMap(map['simInfo']) : null,
      systemFile: map['systemFile'] != null
          ? SystemFiles.fromMap(map['systemFile'])
          : null,
    );
  }

  /// [toJson] is the method to convert the android device information to json.
  String toJson() => json.encode(toMap());

  /// [fromJson] is the method to convert the json to the android device information.
  factory AndroidDeviceInfo.fromJson(String source) =>
      AndroidDeviceInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AndroidDeviceInfo(system: $system, cpu: $cpu, android: $android, drmInfo: $drmInfo, memory: $memory, camera: $camera, battery: $battery, display: $display, thermal: $thermal, network: $network, simInfo: $simInfo, systemFile: $systemFile)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AndroidDeviceInfo &&
        other.system == system &&
        other.cpu == cpu &&
        other.android == android &&
        other.drmInfo == drmInfo &&
        other.memory == memory &&
        other.camera == camera &&
        other.battery == battery &&
        other.display == display &&
        other.thermal == thermal &&
        other.network == network &&
        other.simInfo == simInfo &&
        other.systemFile == systemFile;
  }

  @override
  int get hashCode {
    return system.hashCode ^
        cpu.hashCode ^
        android.hashCode ^
        drmInfo.hashCode ^
        memory.hashCode ^
        camera.hashCode ^
        battery.hashCode ^
        display.hashCode ^
        thermal.hashCode ^
        network.hashCode ^
        simInfo.hashCode ^
        systemFile.hashCode;
  }
}
