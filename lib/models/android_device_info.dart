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

class AndroidDeviceInfo {
  SystemInfo? system;
  CPUInfo? cpu;
  Android? android;
  DRMINFO? drmInfo;
  Memory? memory;
  CameraInfos? camera;
  Battery? battery;
  Display? display;
  Thermal? thermal;
  Network? network;
  SimInfo? simInfo;
  SystemFiles? systemFile;
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

  String toJson() => json.encode(toMap());

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
