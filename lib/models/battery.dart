import 'dart:convert';

/// [Battery] is the class for battery information.
class Battery {
  /// [level] is the level of the battery.
  int? level;

  /// [health] is the health of the battery.
  String? health;

  /// [status] is the status of the battery i.e charging or discharging.
  String? status;

  /// [powerSource] is the power source of the battery.
  String? powerSource;

  /// [technology] is the technology of the battery i.e Li-ion.
  String? technology;

  /// [temperature] is the temperature of the battery in celcius.
  String? temperature;

  /// [voltage] is the voltage of the battery.
  String? voltage;

  /// [powerProfile] is the power profile of the battery.
  String? powerProfile;

  /// constructor for the battery class.
  Battery({
    this.level,
    this.health,
    this.status,
    this.powerSource,
    this.technology,
    this.temperature,
    this.voltage,
    this.powerProfile,
  });

  /// [copyWith] is the method to copy the class.
  Battery copyWith({
    int? level,
    String? health,
    String? status,
    String? powerSource,
    String? technology,
    String? temperature,
    String? voltage,
    String? powerProfile,
  }) {
    return Battery(
      level: level ?? this.level,
      health: health ?? this.health,
      status: status ?? this.status,
      powerSource: powerSource ?? this.powerSource,
      technology: technology ?? this.technology,
      temperature: temperature ?? this.temperature,
      voltage: voltage ?? this.voltage,
      powerProfile: powerProfile ?? this.powerProfile,
    );
  }

  /// [toMap] is the method to convert the class to a map.
  Map<String, dynamic> toMap() {
    return {
      'level': level,
      'health': health,
      'status': status,
      'powerSource': powerSource,
      'technology': technology,
      'temperature': temperature,
      'voltage': voltage,
      'powerProfile': powerProfile,
    };
  }

  /// [fromMap] is the method to convert the map to the class.
  factory Battery.fromMap(Map<String, dynamic> map) {
    return Battery(
      level: map['level']?.toInt(),
      health: map['health'],
      status: map['status'],
      powerSource: map['powerSource'],
      technology: map['technology'],
      temperature: map['temperature'],
      voltage: map['voltage'],
      powerProfile: map['powerProfile'],
    );
  }

  /// [toJson] is the method to convert the class to a json.
  String toJson() => json.encode(toMap());

  /// [fromJson] is the method to convert the json to the class.
  factory Battery.fromJson(String source) =>
      Battery.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Battery(level: $level, health: $health, status: $status, powerSource: $powerSource, technology: $technology, temperature: $temperature, voltage: $voltage, powerProfile: $powerProfile)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Battery &&
        other.level == level &&
        other.health == health &&
        other.status == status &&
        other.powerSource == powerSource &&
        other.technology == technology &&
        other.temperature == temperature &&
        other.voltage == voltage &&
        other.powerProfile == powerProfile;
  }

  @override
  int get hashCode {
    return level.hashCode ^
        health.hashCode ^
        status.hashCode ^
        powerSource.hashCode ^
        technology.hashCode ^
        temperature.hashCode ^
        voltage.hashCode ^
        powerProfile.hashCode;
  }
}
