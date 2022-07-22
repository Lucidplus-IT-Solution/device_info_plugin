import 'dart:convert';

import 'package:flutter/foundation.dart';

/// [Thermal] is information about the thermal.
class Thermal {
  /// list of cpu thermals [ThermalType] i.e cpu0, cpu1, cpu2, cpu3, cpu4, cpu5, cpu6, cpu7.
  List<ThermalType> cpuThermals;

  /// constructor for the class.
  Thermal({
    required this.cpuThermals,
  });

  /// [copyWith] is the function to copy the class.
  Thermal copyWith({
    List<ThermalType>? cpuThermals,
  }) {
    return Thermal(
      cpuThermals: cpuThermals ?? this.cpuThermals,
    );
  }

  /// returns map representation of [Thermal] object.
  Map<String, dynamic> toMap() {
    return {
      'cpuThermals': cpuThermals.map((x) => x.toMap()).toList(),
    };
  }

  /// returns [Thermal] object from map.
  factory Thermal.fromMap(Map<String, dynamic> map) {
    return Thermal(
      cpuThermals: List<ThermalType>.from(
          map['cpuThermals']?.map((x) => ThermalType.fromMap(x))),
    );
  }

  /// returns json representation of [Thermal] object.
  String toJson() => json.encode(toMap());

  /// returns [Thermal] object from json.
  factory Thermal.fromJson(String source) =>
      Thermal.fromMap(json.decode(source));

  @override
  String toString() => 'Thermal(cpuThermals: $cpuThermals)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Thermal && listEquals(other.cpuThermals, cpuThermals);
  }

  @override
  int get hashCode => cpuThermals.hashCode;
}

/// This includes the thermal type name cpu name and the temperature in celcius.
class ThermalType {
  /// The name of cpu core.
  String name;

  /// The temperature of cpu core in celcius.
  String temperature;

  /// constructor for the class.
  ThermalType({
    required this.name,
    required this.temperature,
  });

  /// [copyWith] is the function to copy the class.
  ThermalType copyWith({
    String? name,
    String? temperature,
  }) {
    return ThermalType(
      name: name ?? this.name,
      temperature: temperature ?? this.temperature,
    );
  }

  /// returns the map of thermal type.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'temperature': temperature,
    };
  }

  /// returns [ThermalType] from map.
  factory ThermalType.fromMap(Map<String, dynamic> map) {
    return ThermalType(
      name: map['name'] ?? '',
      temperature: map['temperature'] ?? '',
    );
  }

  /// returns the json string of thermal type.
  String toJson() => json.encode(toMap());

  /// returns [ThermalType] from json string.
  factory ThermalType.fromJson(String source) =>
      ThermalType.fromMap(json.decode(source));

  @override
  String toString() => 'ThermalType(name: $name, temperature: $temperature)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ThermalType &&
        other.name == name &&
        other.temperature == temperature;
  }

  @override
  int get hashCode => name.hashCode ^ temperature.hashCode;
}
