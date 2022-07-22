import 'dart:convert';

import 'package:flutter/foundation.dart';

/// [CameraInfos] is the class for camera information.
class CameraInfos {
  /// [cameras] is the name of the camera.
  List<Cameras> cameras;

  /// constructor for the class.
  CameraInfos({
    required this.cameras,
  });

  /// [copyWith] is the function to copy the class.
  CameraInfos copyWith({
    List<Cameras>? cameras,
  }) {
    return CameraInfos(
      cameras: cameras ?? this.cameras,
    );
  }

  ///[toMap] is the method to convert the class to a map.
  Map<String, dynamic> toMap() {
    return {
      'cameras': cameras.map((x) => x.toMap()).toList(),
    };
  }

  /// [fromMap] is the method to convert a map to the class.
  factory CameraInfos.fromMap(Map<String, dynamic> map) {
    return CameraInfos(
      cameras:
          List<Cameras>.from(map['cameras']?.map((x) => Cameras.fromMap(x))),
    );
  }

  /// [toJson] is the method to convert the class to a json.
  String toJson() => json.encode(toMap());

  /// [fromJson] is the method to convert the json to a class.
  factory CameraInfos.fromJson(String source) =>
      CameraInfos.fromMap(json.decode(source));

  @override
  String toString() => 'CameraInfos(cameras: $cameras)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CameraInfos && listEquals(other.cameras, cameras);
  }

  @override
  int get hashCode => cameras.hashCode;
}

/// [Cameras] is the class to represent the camera.
class Cameras {
  /// [name] is the name of the camera i.e 0 for front and 1 for back.
  String name;

  /// [resolution] is the resolution of the camera in MP.
  String resolution;

  /// [videoResolution] is the video resolution of the camera in MP.
  String videoResolution;

  /// [orientation] is the orientation of the camera.
  String orientation;

  /// [focalLength] is the focal length of the camera.
  String focalLength;

  /// [focusModes] is the supported list of focus modes of the camera.
  List<String> focusModes;

  /// [videoSnapshotSupported] is the flag to check if video snapshot is supported or not.
  bool videoSnapshotSupported;

  /// [videoStabilizationSupported] is the flag to check if video stabilization is supported or not.
  bool videoStabilizationSupported;

  /// [zoomSupported] is the flag to check if zoom is supported or not.
  bool zoomSupported;

  /// [smoothZoomSupported] is the flag to check if smooth zoom is supported or not.
  bool smoothZoomSupported;

  /// [autoExposureLockingSupported] is the flag to check if auto exposure locking is supported or not.
  bool autoExposureLockingSupported;

  /// [autoWhiteBalanceLockingSupported] is the flag to check if auto white balance locking is supported or not.
  bool autoWhiteBalanceLockingSupported;

  ///[flashSupported] is the flag to check if flash is supported or not.
  bool flashSupported;

  /// constructor for the class.
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

  /// [copyWith] is the method to copy the class.
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
      videoSnapshotSupported:
          videoSnapshotSupported ?? this.videoSnapshotSupported,
      videoStabilizationSupported:
          videoStabilizationSupported ?? this.videoStabilizationSupported,
      zoomSupported: zoomSupported ?? this.zoomSupported,
      smoothZoomSupported: smoothZoomSupported ?? this.smoothZoomSupported,
      autoExposureLockingSupported:
          autoExposureLockingSupported ?? this.autoExposureLockingSupported,
      autoWhiteBalanceLockingSupported: autoWhiteBalanceLockingSupported ??
          this.autoWhiteBalanceLockingSupported,
      flashSupported: flashSupported ?? this.flashSupported,
    );
  }

  /// [toMap] is the method to convert the class to map.
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

  /// [fromMap] is the method to convert the map to class.
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
      autoExposureLockingSupported:
          map['autoExposureLockingSupported'] ?? false,
      autoWhiteBalanceLockingSupported:
          map['autoWhiteBalanceLockingSupported'] ?? false,
      flashSupported: map['flashSupported'] ?? false,
    );
  }

  /// [toJson] is the method to convert the class to json.
  String toJson() => json.encode(toMap());

  /// [fromJson] is the method to convert the json to class.
  factory Cameras.fromJson(String source) =>
      Cameras.fromMap(json.decode(source));

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
        other.autoWhiteBalanceLockingSupported ==
            autoWhiteBalanceLockingSupported &&
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
