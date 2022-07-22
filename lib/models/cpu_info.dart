import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';

/// [CPUInfo] is the class for CPU information.
class CPUInfo {
  /// [soc] is the name of the SOC.
  String? soc;

  /// [cpu] is the name of the CPU.
  String? cpu;

  /// [vendor] is the name of the vendor.
  String? vendor;

  /// [cores] is the number of CPU cores.
  String? cores;

  /// [machines] is the architecture of the CPU.
  String? machines;

  /// [cpuClockRange] is the CPU clock range in Mhz.
  String? cpuClockRange;

  /// [CPUCores] is the list CPU clocks.
  List<CPUCores>? cpuClocks;

  /// [supportedAbis] is the list of supported ABIs.
  List<String>? supportedAbis;

  /// [supported32bitAbis] is the list of supported 32-bit ABIs.
  List<String>? supported32bitAbis;

  /// [supported64bitAbis] is the list of supported 64-bit ABIs.
  List<String>? supported64bitAbis;

  /// [instructions] is the list of instructions supported by the CPU.
  List<String>? instructions;

  /// [revision] is the revision of the CPU.
  String? revision;

  /// [governer] is the governor of the CPU.
  String? governer;

  /// [gpu] is the name of the GPU.
  String? gpu;

  /// [gpuVendor] is the name of the GPU vendor.
  String? gpuVendor;

  /// [gpuVersion] is the version of the GPU.
  String? gpuVersion;

  /// [openglExtensions] is the list of OpenGL extensions supported by the GPU.
  List<String>? openglExtensions;
  CPUInfo({
    this.soc,
    this.cpu,
    this.vendor,
    this.cores,
    this.machines,
    this.cpuClockRange,
    this.cpuClocks,
    this.supportedAbis,
    this.supported32bitAbis,
    this.supported64bitAbis,
    this.instructions,
    this.revision,
    this.governer,
    this.gpu,
    this.gpuVendor,
    this.gpuVersion,
    this.openglExtensions,
  });

  CPUInfo copyWith({
    String? soc,
    String? cpu,
    String? vendor,
    String? cores,
    String? machines,
    String? cpuClockRange,
    List<CPUCores>? cpuClocks,
    List<String>? supportedAbis,
    List<String>? supported32bitAbis,
    List<String>? supported64bitAbis,
    List<String>? instructions,
    String? revision,
    String? governer,
    String? gpu,
    String? gpuVendor,
    String? gpuVersion,
    List<String>? openglExtensions,
  }) {
    return CPUInfo(
      soc: soc ?? this.soc,
      cpu: cpu ?? this.cpu,
      vendor: vendor ?? this.vendor,
      cores: cores ?? this.cores,
      machines: machines ?? this.machines,
      cpuClockRange: cpuClockRange ?? this.cpuClockRange,
      cpuClocks: cpuClocks ?? this.cpuClocks,
      supportedAbis: supportedAbis ?? this.supportedAbis,
      supported32bitAbis: supported32bitAbis ?? this.supported32bitAbis,
      supported64bitAbis: supported64bitAbis ?? this.supported64bitAbis,
      instructions: instructions ?? this.instructions,
      revision: revision ?? this.revision,
      governer: governer ?? this.governer,
      gpu: gpu ?? this.gpu,
      gpuVendor: gpuVendor ?? this.gpuVendor,
      gpuVersion: gpuVersion ?? this.gpuVersion,
      openglExtensions: openglExtensions ?? this.openglExtensions,
    );
  }

  /// [toMap] is the method to convert the class to a map.
  Map<String, dynamic> toMap() {
    return {
      'soc': soc,
      'cpu': cpu,
      'vendor': vendor,
      'cores': cores,
      'machines': machines,
      'cpuClockRange': cpuClockRange,
      'cpuClocks': cpuClocks?.map((x) => x.toMap()).toList(),
      'supportedAbis': supportedAbis,
      'supported32bitAbis': supported32bitAbis,
      'supported64bitAbis': supported64bitAbis,
      'instructions': instructions,
      'revision': revision,
      'governer': governer,
      'gpu': gpu,
      'gpuVendor': gpuVendor,
      'gpuVersion': gpuVersion,
      'openglExtensions': openglExtensions,
    };
  }

  /// [fromMap] is the method to convert the map to a class.
  factory CPUInfo.fromMap(Map<String, dynamic> map) {
    return CPUInfo(
      soc: map['soc'],
      cpu: map['cpu'],
      vendor: map['vendor'],
      cores: map['cores'],
      machines: map['machines'],
      cpuClockRange: map['cpuClockRange'],
      cpuClocks: map['cpuClocks'] != null
          ? List<CPUCores>.from(
              map['cpuClocks']?.map((x) => CPUCores.fromMap(x)))
          : null,
      supportedAbis: map['supportedAbis'] != null
          ? List<String>.from(map['supportedAbis'])
          : [],
      supported32bitAbis: map['supported32bitAbis'] != null
          ? List<String>.from(map['supported32bitAbis'])
          : [],
      supported64bitAbis: map['supported64bitAbis'] != null
          ? List<String>.from(map['supported64bitAbis'])
          : [],
      instructions: List<String>.from(map['instructions']),
      revision: map['revision'],
      governer: map['governer'],
      gpu: map['gpu'],
      gpuVendor: map['gpuVendor'],
      gpuVersion: map['gpuVersion'],
      openglExtensions: map['openglExtensions'] != null
          ? List<String>.from(map['openglExtensions'])
          : [],
    );
  }

  /// [toJson] is the method to convert the class to a json.
  String toJson() => json.encode(toMap());

  /// [fromJson] is the method to convert the json to a class.
  factory CPUInfo.fromJson(String source) =>
      CPUInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CPUInfo(soc: $soc, cpu: $cpu, vendor: $vendor, cores: $cores, machines: $machines, cpuClockRange: $cpuClockRange, cpuClocks: $cpuClocks, supportedAbis: $supportedAbis, supported32bitAbis: $supported32bitAbis, supported64bitAbis: $supported64bitAbis, instructions: $instructions, revision: $revision, governer: $governer, gpu: $gpu, gpuVendor: $gpuVendor, gpuVersion: $gpuVersion, openglExtensions: $openglExtensions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CPUInfo &&
        other.soc == soc &&
        other.cpu == cpu &&
        other.vendor == vendor &&
        other.cores == cores &&
        other.machines == machines &&
        other.cpuClockRange == cpuClockRange &&
        listEquals(other.cpuClocks, cpuClocks) &&
        listEquals(other.supportedAbis, supportedAbis) &&
        listEquals(other.supported32bitAbis, supported32bitAbis) &&
        listEquals(other.supported64bitAbis, supported64bitAbis) &&
        listEquals(other.instructions, instructions) &&
        other.revision == revision &&
        other.governer == governer &&
        other.gpu == gpu &&
        other.gpuVendor == gpuVendor &&
        other.gpuVersion == gpuVersion &&
        listEquals(other.openglExtensions, openglExtensions);
  }

  @override
  int get hashCode {
    return soc.hashCode ^
        cpu.hashCode ^
        vendor.hashCode ^
        cores.hashCode ^
        machines.hashCode ^
        cpuClockRange.hashCode ^
        cpuClocks.hashCode ^
        supportedAbis.hashCode ^
        supported32bitAbis.hashCode ^
        supported64bitAbis.hashCode ^
        instructions.hashCode ^
        revision.hashCode ^
        governer.hashCode ^
        gpu.hashCode ^
        gpuVendor.hashCode ^
        gpuVersion.hashCode ^
        openglExtensions.hashCode;
  }
}

/// [CPUCores] is the class to represent the cpu cores.
class CPUCores {
  /// [name] is the name of the core.
  String name;

  /// [frequency] is the frequency of the core.
  double frequency;
  CPUCores({
    required this.name,
    required this.frequency,
  });

  CPUCores copyWith({
    String? name,
    double? frequency,
  }) {
    return CPUCores(
      name: name ?? this.name,
      frequency: frequency ?? this.frequency,
    );
  }

  /// [toMap] is the method to convert the class to a map.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'frequency': frequency,
    };
  }

  /// [fromMap] is the method to convert the map to a class.
  factory CPUCores.fromMap(Map<String, dynamic> map) {
    return CPUCores(
      name: map['name'] ?? '',
      frequency: map['frequency']?.toDouble() ?? 0.0,
    );
  }

  /// [toJson] is the method to convert the class to a json.
  String toJson() => json.encode(toMap());

  /// [fromJson] is the method to convert the json to a class.
  factory CPUCores.fromJson(String source) =>
      CPUCores.fromMap(json.decode(source));

  @override
  String toString() => 'CPUCores(name: $name, frequency: $frequency)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CPUCores &&
        other.name == name &&
        other.frequency == frequency;
  }

  @override
  int get hashCode => name.hashCode ^ frequency.hashCode;
}
