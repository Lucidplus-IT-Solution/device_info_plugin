import 'dart:convert';

class DRMINFO {
  String vendor = "UNKNOWN";
  String version = "UNKNOWN";
  String description = "UNKNOWN";
  String algorithms = "UNKNOWN";
  String systemId = "UNKNOWN";
  String securityLevel = "UNKNOWN";
  String hdcpLevel = "UNKNOWN";
  String maxHdcpLevel = "UNKNOWN";
  String usageRepostingSupport = "UNKNOWN";
  String maxNoOfSessions = "UNKNOWN";
  String noOfOpenSessions = "UNKNOWN";
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

  String toJson() => json.encode(toMap());

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
