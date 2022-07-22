import 'dart:convert';

///This document provides an overview of the Android digital rights management (DRM) framework and
///introduces the interfaces that a DRM plugin must implement.
///This document doesn't describe robustness rules or compliance rules that may be defined by a DRM scheme.
///
/// [DRMINFO] is information about the DRM.
class DRMINFO {
  /// [vendor] is the vendor of the DRM.
  String vendor = "UNKNOWN";

  /// [version] is the version of the DRM.
  String version = "UNKNOWN";

  /// [description] is the description of the DRM.
  String description = "UNKNOWN";

  /// [algorithms] is the algorithms of the DRM.
  String algorithms = "UNKNOWN";

  /// [systemId] is the system id of the DRM.
  String systemId = "UNKNOWN";

  /// [securityLevel] is the security level of the DRM.
  String securityLevel = "UNKNOWN";

  /// [hdcpLevel] is the hdcp level of the DRM.
  String hdcpLevel = "UNKNOWN";

  /// [maxHdcpLevel] is the max hdcp level of the DRM.
  String maxHdcpLevel = "UNKNOWN";

  /// [usageRepostingSupport] is the usage reposting support of the DRM.
  String usageRepostingSupport = "UNKNOWN";

  /// [maxNoOfSessions] is the max no of sessions of the DRM.
  String maxNoOfSessions = "UNKNOWN";

  /// [noOfOpenSessions] is the no of open sessions of the DRM.
  String noOfOpenSessions = "UNKNOWN";

  /// constructor for the DRMINFO class.
  DRMINFO({
    required this.vendor,
    required this.version,
    required this.description,
    required this.algorithms,
    required this.systemId,
    required this.securityLevel,
    required this.hdcpLevel,
    required this.maxHdcpLevel,
    required this.usageRepostingSupport,
    required this.maxNoOfSessions,
    required this.noOfOpenSessions,
  });

  /// [copyWith] is the function to copy the class.
  DRMINFO copyWith({
    String? vendor,
    String? version,
    String? description,
    String? algorithms,
    String? systemId,
    String? securityLevel,
    String? hdcpLevel,
    String? maxHdcpLevel,
    String? usageRepostingSupport,
    String? maxNoOfSessions,
    String? noOfOpenSessions,
  }) {
    return DRMINFO(
      vendor: vendor ?? this.vendor,
      version: version ?? this.version,
      description: description ?? this.description,
      algorithms: algorithms ?? this.algorithms,
      systemId: systemId ?? this.systemId,
      securityLevel: securityLevel ?? this.securityLevel,
      hdcpLevel: hdcpLevel ?? this.hdcpLevel,
      maxHdcpLevel: maxHdcpLevel ?? this.maxHdcpLevel,
      usageRepostingSupport:
          usageRepostingSupport ?? this.usageRepostingSupport,
      maxNoOfSessions: maxNoOfSessions ?? this.maxNoOfSessions,
      noOfOpenSessions: noOfOpenSessions ?? this.noOfOpenSessions,
    );
  }

  /// [toMap] returns the map of DRMINFO.
  Map<String, dynamic> toMap() {
    return {
      'vendor': vendor,
      'version': version,
      'description': description,
      'algorithms': algorithms,
      'systemId': systemId,
      'securityLevel': securityLevel,
      'hdcpLevel': hdcpLevel,
      'maxHdcpLevel': maxHdcpLevel,
      'usageRepostingSupport': usageRepostingSupport,
      'maxNoOfSessions': maxNoOfSessions,
      'noOfOpenSessions': noOfOpenSessions,
    };
  }

  /// [fromMap] returns the DRMINFO from map.
  factory DRMINFO.fromMap(Map<String, dynamic> map) {
    return DRMINFO(
      vendor: map['vendor'] ?? '',
      version: map['version'] ?? '',
      description: map['description'] ?? '',
      algorithms: map['algorithms'] ?? '',
      systemId: map['systemId'] ?? '',
      securityLevel: map['securityLevel'] ?? '',
      hdcpLevel: map['hdcpLevel'] ?? '',
      maxHdcpLevel: map['maxHdcpLevel'] ?? '',
      usageRepostingSupport: map['usageRepostingSupport'] ?? '',
      maxNoOfSessions: map['maxNoOfSessions'] ?? '',
      noOfOpenSessions: map['noOfOpenSessions'] ?? '',
    );
  }

  /// [toJson] returns the DRMINFO from JSON.
  String toJson() => json.encode(toMap());

  /// [fromJson] returns the DRMINFO from JSON.
  factory DRMINFO.fromJson(String source) =>
      DRMINFO.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DRMINFO(vendor: $vendor, version: $version, description: $description, algorithms: $algorithms, systemId: $systemId, securityLevel: $securityLevel, hdcpLevel: $hdcpLevel, maxHdcpLevel: $maxHdcpLevel, usageRepostingSupport: $usageRepostingSupport, maxNoOfSessions: $maxNoOfSessions, noOfOpenSessions: $noOfOpenSessions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DRMINFO &&
        other.vendor == vendor &&
        other.version == version &&
        other.description == description &&
        other.algorithms == algorithms &&
        other.systemId == systemId &&
        other.securityLevel == securityLevel &&
        other.hdcpLevel == hdcpLevel &&
        other.maxHdcpLevel == maxHdcpLevel &&
        other.usageRepostingSupport == usageRepostingSupport &&
        other.maxNoOfSessions == maxNoOfSessions &&
        other.noOfOpenSessions == noOfOpenSessions;
  }

  @override
  int get hashCode {
    return vendor.hashCode ^
        version.hashCode ^
        description.hashCode ^
        algorithms.hashCode ^
        systemId.hashCode ^
        securityLevel.hashCode ^
        hdcpLevel.hashCode ^
        maxHdcpLevel.hashCode ^
        usageRepostingSupport.hashCode ^
        maxNoOfSessions.hashCode ^
        noOfOpenSessions.hashCode;
  }
}
