import 'dart:convert';
import 'dart:core';

/// [Display] is information about the display.
class Display {
  /// [resolution] is the resolution of the display.
  String resolution;

  /// [density] is the density of the display.
  String density;

  /// [screenSize] is the screen size of the display.
  String screenSize;

  /// [refreshRate] is the refresh rate of the display in Hz.
  String refreshRate;

  /// [hdrCapabilities] is the hdr capability of the display.
  String hdrCapabilities;

  /// [brightnessLevel] is the current brightness level of the display.
  String brightnessLevel;

  /// [screenTimeout] is the screen timeout of the display in milliseconds.
  String screenTimeout;

  /// [orientation] is the orientation of the display.

  String orientation;

  Display({
    required this.resolution,
    required this.density,
    required this.screenSize,
    required this.refreshRate,
    required this.hdrCapabilities,
    required this.brightnessLevel,
    required this.screenTimeout,
    required this.orientation,
  });

  Display copyWith({
    String? resolution,
    String? density,
    String? screenSize,
    String? refreshRate,
    String? hdrCapabilities,
    String? brightnessLevel,
    String? screenTimeout,
    String? orientation,
  }) {
    return Display(
      resolution: resolution ?? this.resolution,
      density: density ?? this.density,
      screenSize: screenSize ?? this.screenSize,
      refreshRate: refreshRate ?? this.refreshRate,
      hdrCapabilities: hdrCapabilities ?? this.hdrCapabilities,
      brightnessLevel: brightnessLevel ?? this.brightnessLevel,
      screenTimeout: screenTimeout ?? this.screenTimeout,
      orientation: orientation ?? this.orientation,
    );
  }

  /// [toMap] creates a map from the current [Display] object.
  Map<String, dynamic> toMap() {
    return {
      'resolution': resolution,
      'density': density,
      'screenSize': screenSize,
      'refreshRate': refreshRate,
      'hdrCapabilities': hdrCapabilities,
      'brightnessLevel': brightnessLevel,
      'screenTimeout': screenTimeout,
      'orientation': orientation,
    };
  }

  /// [fromMap] creates a [Display] object from a map.
  factory Display.fromMap(Map<String, dynamic> map) {
    return Display(
      resolution: map['resolution'] ?? '',
      density: map['density'] ?? '',
      screenSize: map['screenSize'] ?? '',
      refreshRate: map['refreshRate'] ?? '',
      hdrCapabilities: map['hdrCapabilities'] ?? '',
      brightnessLevel: map['brightnessLevel'] ?? '',
      screenTimeout: map['screenTimeout'] ?? '',
      orientation: map['orientation'] ?? '',
    );
  }

  /// [toJson] creates a JSON object from the current [Display] object.
  String toJson() => json.encode(toMap());

  /// [fromJson] creates a [Display] object from a JSON object.
  factory Display.fromJson(String source) =>
      Display.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Display(resolution: $resolution, density: $density, screenSize: $screenSize, refreshRate: $refreshRate, hdrCapabilities: $hdrCapabilities, brightnessLevel: $brightnessLevel, screenTimeout: $screenTimeout, orientation: $orientation)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Display &&
        other.resolution == resolution &&
        other.density == density &&
        other.screenSize == screenSize &&
        other.refreshRate == refreshRate &&
        other.hdrCapabilities == hdrCapabilities &&
        other.brightnessLevel == brightnessLevel &&
        other.screenTimeout == screenTimeout &&
        other.orientation == orientation;
  }

  @override
  int get hashCode {
    return resolution.hashCode ^
        density.hashCode ^
        screenSize.hashCode ^
        refreshRate.hashCode ^
        hdrCapabilities.hashCode ^
        brightnessLevel.hashCode ^
        screenTimeout.hashCode ^
        orientation.hashCode;
  }
}
