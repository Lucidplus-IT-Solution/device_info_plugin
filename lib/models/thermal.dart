import 'dart:convert';

import 'package:flutter/foundation.dart';

class Thermal {
  List<ThermalType> cpuThermals;
  Thermal({
    required this.cpuThermals,
  });

  Thermal copyWith({
    List<ThermalType>? cpuThermals,
  }) {
    return Thermal(
      cpuThermals: cpuThermals ?? this.cpuThermals,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cpuThermals': cpuThermals.map((x) => x.toMap()).toList(),
    };
  }

  factory Thermal.fromMap(Map<String, dynamic> map) {
    return Thermal(
      cpuThermals: List<ThermalType>.from(
          map['cpuThermals']?.map((x) => ThermalType.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

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

class ThermalType {
  String name;
  String temperature;
  ThermalType({
    required this.name,
    required this.temperature,
  });

  ThermalType copyWith({
    String? name,
    String? temperature,
  }) {
    return ThermalType(
      name: name ?? this.name,
      temperature: temperature ?? this.temperature,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'temperature': temperature,
    };
  }

  factory ThermalType.fromMap(Map<String, dynamic> map) {
    return ThermalType(
      name: map['name'] ?? '',
      temperature: map['temperature'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

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
