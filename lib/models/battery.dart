import 'dart:convert';

class Battery {
  int? level;
  String? health;
  String? status;
  String? powerSource;
  String? technology;
  String? temperature;
  String? voltage;
  String? powerProfile;
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

  String toJson() => json.encode(toMap());

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
