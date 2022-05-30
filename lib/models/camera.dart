import 'dart:convert';

import 'package:flutter/foundation.dart';

class CameraInfos {
  List<Cameras> cameras;
  CameraInfos({
    required this.cameras,
  });

  CameraInfos copyWith({
    List<Cameras>? cameras,
  }) {
    return CameraInfos(
      cameras: cameras ?? this.cameras,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cameras': cameras.map((x) => x.toMap()).toList(),
    };
  }

  factory CameraInfos.fromMap(Map<String, dynamic> map) {
    return CameraInfos(
      cameras: List<Cameras>.from(map['cameras']?.map((x) => Cameras.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CameraInfos.fromJson(String source) => CameraInfos.fromMap(json.decode(source));

  @override
  String toString() => 'CameraInfos(cameras: $cameras)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CameraInfos &&
      listEquals(other.cameras, cameras);
  }

  @override
  int get hashCode => cameras.hashCode;
}

class Cameras {
  String name;
  String resolution;
  String videoResolution;
  String orientation;
  String focalLength;
  List<String> focusModes;
  bool videoSnapshotSupported;
  bool videoStabilizationSupported;
  bool zoomSupported;
  bool smoothZoomSupported;
  bool autoExposureLockingSupported;
  bool autoWhiteBalanceLockingSupported;
  bool flashSupported;
  Cameras({
    required this.name,
    required this.resolution,
    required this.videoResolution,
    required this.orientation,
    required this.focalLength,
    required this.focusModes,
    required this.videoSnapshotSupported,
    required this.videoStabilizationSupported,
    required this.zoomSupported,
    required this.smoothZoomSupported,
    required this.autoExposureLockingSupported,
    required this.autoWhiteBalanceLockingSupported,
    required this.flashSupported,
  });

  Cameras copyWith({
    String? name,
    String? resolution,
    String? videoResolution,
    String? orientation,
    String? focalLength,
    List<String>? focusModes,
    bool? videoSnapshotSupported,
    bool? videoStabilizationSupported,
    bool? zoomSupported,
    bool? smoothZoomSupported,
    bool? autoExposureLockingSupported,
    bool? autoWhiteBalanceLockingSupported,
    bool? flashSupported,
  }) {
    return Cameras(
      name: name ?? this.name,
      resolution: resolution ?? this.resolution,
      videoResolution: videoResolution ?? this.videoResolution,
      orientation: orientation ?? this.orientation,
      focalLength: focalLength ?? this.focalLength,
      focusModes: focusModes ?? this.focusModes,
      videoSnapshotSupported: videoSnapshotSupported ?? this.videoSnapshotSupported,
      videoStabilizationSupported: videoStabilizationSupported ?? this.videoStabilizationSupported,
      zoomSupported: zoomSupported ?? this.zoomSupported,
      smoothZoomSupported: smoothZoomSupported ?? this.smoothZoomSupported,
      autoExposureLockingSupported: autoExposureLockingSupported ?? this.autoExposureLockingSupported,
      autoWhiteBalanceLockingSupported: autoWhiteBalanceLockingSupported ?? this.autoWhiteBalanceLockingSupported,
      flashSupported: flashSupported ?? this.flashSupported,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'resolution': resolution,
      'videoResolution': videoResolution,
      'orientation': orientation,
      'focalLength': focalLength,
      'focusModes': focusModes,
      'videoSnapshotSupported': videoSnapshotSupported,
      'videoStabilizationSupported': videoStabilizationSupported,
      'zoomSupported': zoomSupported,
      'smoothZoomSupported': smoothZoomSupported,
      'autoExposureLockingSupported': autoExposureLockingSupported,
      'autoWhiteBalanceLockingSupported': autoWhiteBalanceLockingSupported,
      'flashSupported': flashSupported,
    };
  }

  factory Cameras.fromMap(Map<String, dynamic> map) {
    return Cameras(
      name: map['name'] ?? '',
      resolution: map['resolution'] ?? '',
      videoResolution: map['videoResolution'] ?? '',
      orientation: map['orientation'] ?? '',
      focalLength: map['focalLength'] ?? '',
      focusModes: List<String>.from(map['focusModes']),
      videoSnapshotSupported: map['videoSnapshotSupported'] ?? false,
      videoStabilizationSupported: map['videoStabilizationSupported'] ?? false,
      zoomSupported: map['zoomSupported'] ?? false,
      smoothZoomSupported: map['smoothZoomSupported'] ?? false,
      autoExposureLockingSupported: map['autoExposureLockingSupported'] ?? false,
      autoWhiteBalanceLockingSupported: map['autoWhiteBalanceLockingSupported'] ?? false,
      flashSupported: map['flashSupported'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cameras.fromJson(String source) => Cameras.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Cameras(name: $name, resolution: $resolution, videoResolution: $videoResolution, orientation: $orientation, focalLength: $focalLength, focusModes: $focusModes, videoSnapshotSupported: $videoSnapshotSupported, videoStabilizationSupported: $videoStabilizationSupported, zoomSupported: $zoomSupported, smoothZoomSupported: $smoothZoomSupported, autoExposureLockingSupported: $autoExposureLockingSupported, autoWhiteBalanceLockingSupported: $autoWhiteBalanceLockingSupported, flashSupported: $flashSupported)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Cameras &&
      other.name == name &&
      other.resolution == resolution &&
      other.videoResolution == videoResolution &&
      other.orientation == orientation &&
      other.focalLength == focalLength &&
      listEquals(other.focusModes, focusModes) &&
      other.videoSnapshotSupported == videoSnapshotSupported &&
      other.videoStabilizationSupported == videoStabilizationSupported &&
      other.zoomSupported == zoomSupported &&
      other.smoothZoomSupported == smoothZoomSupported &&
      other.autoExposureLockingSupported == autoExposureLockingSupported &&
      other.autoWhiteBalanceLockingSupported == autoWhiteBalanceLockingSupported &&
      other.flashSupported == flashSupported;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      resolution.hashCode ^
      videoResolution.hashCode ^
      orientation.hashCode ^
      focalLength.hashCode ^
      focusModes.hashCode ^
      videoSnapshotSupported.hashCode ^
      videoStabilizationSupported.hashCode ^
      zoomSupported.hashCode ^
      smoothZoomSupported.hashCode ^
      autoExposureLockingSupported.hashCode ^
      autoWhiteBalanceLockingSupported.hashCode ^
      flashSupported.hashCode;
  }
}
