import 'dart:convert';

import 'package:flutter/foundation.dart';

class SimInfo {
  List<SIMType> sims;
  SimInfo({
    required this.sims,
  });

  SimInfo copyWith({
    List<SIMType>? sims,
  }) {
    return SimInfo(
      sims: sims ?? this.sims,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sims': sims.map((x) => x.toMap()).toList(),
    };
  }

  factory SimInfo.fromMap(Map<String, dynamic> map) {
    return SimInfo(
      sims: List<SIMType>.from(map['sims']?.map((x) => SIMType.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SimInfo.fromJson(String source) => SimInfo.fromMap(json.decode(source));

  @override
  String toString() => 'SimInfo(sims: $sims)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SimInfo &&
      listEquals(other.sims, sims);
  }

  @override
  int get hashCode => sims.hashCode;
}


class SIMType {
  String slotName;
  String simState;
  String lineNumber;
  String voicemailNumber;
  String serialNumberIccid;
  String operatorName;
  String operatorCodeMccMnc;
  String country;
  int softwareVersion;
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

  String toJson() => json.encode(toMap());

  factory SIMType.fromJson(String source) => SIMType.fromMap(json.decode(source));

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
