import 'dart:convert';

import 'package:flutter/foundation.dart';

/// [SimInfo] is information about the sims.
class SimInfo {
  /// [sims] is list of [SIMType].
  List<SIMType> sims;

  /// constructor for the class.
  SimInfo({
    required this.sims,
  });

  /// [copyWith] is the function to copy the class.
  SimInfo copyWith({
    List<SIMType>? sims,
  }) {
    return SimInfo(
      sims: sims ?? this.sims,
    );
  }

  /// [toMap] returns a map of the object.
  Map<String, dynamic> toMap() {
    return {
      'sims': sims.map((x) => x.toMap()).toList(),
    };
  }

  /// [fromMap] returns instance of [SimInfo] from a map.
  factory SimInfo.fromMap(Map<String, dynamic> map) {
    return SimInfo(
      sims: List<SIMType>.from(map['sims']?.map((x) => SIMType.fromMap(x))),
    );
  }

  /// [toJson] returns a json string of the object.
  String toJson() => json.encode(toMap());

  /// [fromJson] returns a instance of [SimInfo] from a json string.
  factory SimInfo.fromJson(String source) =>
      SimInfo.fromMap(json.decode(source));

  @override
  String toString() => 'SimInfo(sims: $sims)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SimInfo && listEquals(other.sims, sims);
  }

  @override
  int get hashCode => sims.hashCode;
}

/// [SIMType] includes the sim slot name,sim state (active/inactive) ,line number,voice mail number,serial number iccc id,sim operator name,
/// operator mcc,operator mnc,sim country code & software version.
class SIMType {
  /// The name of sim slot.
  String slotName;

  /// The state of sim slot.
  String simState;

  /// The line number of sim slot.
  String lineNumber;

  /// The voice mail number of sim slot.
  String voicemailNumber;

  /// The serial number of sim slot.
  String serialNumberIccid;

  /// The sim operator name of sim slot.
  String operatorName;

  /// The operator mcc of sim slot.
  String operatorCodeMccMnc;

  /// The sim country code of sim slot.
  String country;

  /// The software version of sim slot.
  int softwareVersion;

  /// constructor of [SIMType]
  SIMType({
    required this.slotName,
    required this.simState,
    required this.lineNumber,
    required this.voicemailNumber,
    required this.serialNumberIccid,
    required this.operatorName,
    required this.operatorCodeMccMnc,
    required this.country,
    required this.softwareVersion,
  });

  /// [copyWith] is the method to copy the class.
  SIMType copyWith({
    String? slotName,
    String? simState,
    String? lineNumber,
    String? voicemailNumber,
    String? serialNumberIccid,
    String? operatorName,
    String? operatorCodeMccMnc,
    String? country,
    int? softwareVersion,
  }) {
    return SIMType(
      slotName: slotName ?? this.slotName,
      simState: simState ?? this.simState,
      lineNumber: lineNumber ?? this.lineNumber,
      voicemailNumber: voicemailNumber ?? this.voicemailNumber,
      serialNumberIccid: serialNumberIccid ?? this.serialNumberIccid,
      operatorName: operatorName ?? this.operatorName,
      operatorCodeMccMnc: operatorCodeMccMnc ?? this.operatorCodeMccMnc,
      country: country ?? this.country,
      softwareVersion: softwareVersion ?? this.softwareVersion,
    );
  }

  /// returns the map of sim type.
  Map<String, dynamic> toMap() {
    return {
      'slotName': slotName,
      'simState': simState,
      'lineNumber': lineNumber,
      'voicemailNumber': voicemailNumber,
      'serialNumberIccid': serialNumberIccid,
      'operatorName': operatorName,
      'operatorCodeMccMnc': operatorCodeMccMnc,
      'country': country,
      'softwareVersion': softwareVersion,
    };
  }

  /// returns [SIMType] from map.
  factory SIMType.fromMap(Map<String, dynamic> map) {
    return SIMType(
      slotName: map['slotName'] ?? '',
      simState: map['simState'] ?? '',
      lineNumber: map['lineNumber'] ?? '',
      voicemailNumber: map['voicemailNumber'] ?? '',
      serialNumberIccid: map['serialNumberIccid'] ?? '',
      operatorName: map['operatorName'] ?? '',
      operatorCodeMccMnc: map['operatorCodeMccMnc'] ?? '',
      country: map['country'] ?? '',
      softwareVersion: map['softwareVersion']?.toInt() ?? 0,
    );
  }

  /// returns the json string of sim type.
  String toJson() => json.encode(toMap());

  /// returns [SIMType] from json string.
  factory SIMType.fromJson(String source) =>
      SIMType.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SIMType(slotName: $slotName, simState: $simState, lineNumber: $lineNumber, voicemailNumber: $voicemailNumber, serialNumberIccid: $serialNumberIccid, operatorName: $operatorName, operatorCodeMccMnc: $operatorCodeMccMnc, country: $country, softwareVersion: $softwareVersion)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SIMType &&
        other.slotName == slotName &&
        other.simState == simState &&
        other.lineNumber == lineNumber &&
        other.voicemailNumber == voicemailNumber &&
        other.serialNumberIccid == serialNumberIccid &&
        other.operatorName == operatorName &&
        other.operatorCodeMccMnc == operatorCodeMccMnc &&
        other.country == country &&
        other.softwareVersion == softwareVersion;
  }

  @override
  int get hashCode {
    return slotName.hashCode ^
        simState.hashCode ^
        lineNumber.hashCode ^
        voicemailNumber.hashCode ^
        serialNumberIccid.hashCode ^
        operatorName.hashCode ^
        operatorCodeMccMnc.hashCode ^
        country.hashCode ^
        softwareVersion.hashCode;
  }
}
