import 'dart:convert';

class SystemInfo {
  String manufacture;
  String model;
  String brand;
  String android;
  String apiLevel;
  String codeName;
  String density;
  String refreshRate;
  String product;
  String board;
  String build;
  String javaVmVersion;
  String security;
  String baseband;
  String serial;
  String buildType;
  String tags;
  String incremental;
  String fingerprint;
  String fingerprintManufacture;
  String fingerprintModel;
  String defaultOrientation;
  String bootloader;
  String selinux;
  SystemInfo({
    required this.manufacture,
    required this.model,
    required this.brand,
    required this.android,
    required this.apiLevel,
    required this.codeName,
    required this.density,
    required this.refreshRate,
    required this.product,
    required this.board,
    required this.build,
    required this.javaVmVersion,
    required this.security,
    required this.baseband,
    required this.serial,
    required this.buildType,
    required this.tags,
    required this.incremental,
    required this.fingerprint,
    required this.fingerprintManufacture,
    required this.fingerprintModel,
    required this.defaultOrientation,
    required this.bootloader,
    required this.selinux,
  });


  SystemInfo copyWith({
    String? manufacture,
    String? model,
    String? brand,
    String? android,
    String? apiLevel,
    String? codeName,
    String? density,
    String? refreshRate,
    String? product,
    String? board,
    String? build,
    String? javaVmVersion,
    String? security,
    String? baseband,
    String? serial,
    String? buildType,
    String? tags,
    String? incremental,
    String? fingerprint,
    String? fingerprintManufacture,
    String? fingerprintModel,
    String? defaultOrientation,
    String? bootloader,
    String? selinux,
  }) {
    return SystemInfo(
      manufacture: manufacture ?? this.manufacture,
      model: model ?? this.model,
      brand: brand ?? this.brand,
      android: android ?? this.android,
      apiLevel: apiLevel ?? this.apiLevel,
      codeName: codeName ?? this.codeName,
      density: density ?? this.density,
      refreshRate: refreshRate ?? this.refreshRate,
      product: product ?? this.product,
      board: board ?? this.board,
      build: build ?? this.build,
      javaVmVersion: javaVmVersion ?? this.javaVmVersion,
      security: security ?? this.security,
      baseband: baseband ?? this.baseband,
      serial: serial ?? this.serial,
      buildType: buildType ?? this.buildType,
      tags: tags ?? this.tags,
      incremental: incremental ?? this.incremental,
      fingerprint: fingerprint ?? this.fingerprint,
      fingerprintManufacture: fingerprintManufacture ?? this.fingerprintManufacture,
      fingerprintModel: fingerprintModel ?? this.fingerprintModel,
      defaultOrientation: defaultOrientation ?? this.defaultOrientation,
      bootloader: bootloader ?? this.bootloader,
      selinux: selinux ?? this.selinux,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'manufacture': manufacture,
      'model': model,
      'brand': brand,
      'android': android,
      'apiLevel': apiLevel,
      'codeName': codeName,
      'density': density,
      'refreshRate': refreshRate,
      'product': product,
      'board': board,
      'build': build,
      'javaVmVersion': javaVmVersion,
      'security': security,
      'baseband': baseband,
      'serial': serial,
      'buildType': buildType,
      'tags': tags,
      'incremental': incremental,
      'fingerprint': fingerprint,
      'fingerprintManufacture': fingerprintManufacture,
      'fingerprintModel': fingerprintModel,
      'defaultOrientation': defaultOrientation,
      'bootloader': bootloader,
      'selinux': selinux,
    };
  }

  factory SystemInfo.fromMap(Map<String, dynamic> map) {
    return SystemInfo(
      manufacture: map['manufacture'] ?? '',
      model: map['model'] ?? '',
      brand: map['brand'] ?? '',
      android: map['android'] ?? '',
      apiLevel: map['apiLevel'] ?? '',
      codeName: map['codeName'] ?? '',
      density: map['density'] ?? '',
      refreshRate: map['refreshRate'] ?? '',
      product: map['product'] ?? '',
      board: map['board'] ?? '',
      build: map['build'] ?? '',
      javaVmVersion: map['javaVmVersion'] ?? '',
      security: map['security'] ?? '',
      baseband: map['baseband'] ?? '',
      serial: map['serial'] ?? '',
      buildType: map['buildType'] ?? '',
      tags: map['tags'] ?? '',
      incremental: map['incremental'] ?? '',
      fingerprint: map['fingerprint'] ?? '',
      fingerprintManufacture: map['fingerprintManufacture'] ?? '',
      fingerprintModel: map['fingerprintModel'] ?? '',
      defaultOrientation: map['defaultOrientation'] ?? '',
      bootloader: map['bootloader'] ?? '',
      selinux: map['selinux'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SystemInfo.fromJson(String source) => SystemInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SystemInfo(manufacture: $manufacture, model: $model, brand: $brand, android: $android, apiLevel: $apiLevel, codeName: $codeName, density: $density, refreshRate: $refreshRate, product: $product, board: $board, build: $build, javaVmVersion: $javaVmVersion, security: $security, baseband: $baseband, serial: $serial, buildType: $buildType, tags: $tags, incremental: $incremental, fingerprint: $fingerprint, fingerprintManufacture: $fingerprintManufacture, fingerprintModel: $fingerprintModel, defaultOrientation: $defaultOrientation, bootloader: $bootloader, selinux: $selinux)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SystemInfo &&
      other.manufacture == manufacture &&
      other.model == model &&
      other.brand == brand &&
      other.android == android &&
      other.apiLevel == apiLevel &&
      other.codeName == codeName &&
      other.density == density &&
      other.refreshRate == refreshRate &&
      other.product == product &&
      other.board == board &&
      other.build == build &&
      other.javaVmVersion == javaVmVersion &&
      other.security == security &&
      other.baseband == baseband &&
      other.serial == serial &&
      other.buildType == buildType &&
      other.tags == tags &&
      other.incremental == incremental &&
      other.fingerprint == fingerprint &&
      other.fingerprintManufacture == fingerprintManufacture &&
      other.fingerprintModel == fingerprintModel &&
      other.defaultOrientation == defaultOrientation &&
      other.bootloader == bootloader &&
      other.selinux == selinux;
  }

  @override
  int get hashCode {
    return manufacture.hashCode ^
      model.hashCode ^
      brand.hashCode ^
      android.hashCode ^
      apiLevel.hashCode ^
      codeName.hashCode ^
      density.hashCode ^
      refreshRate.hashCode ^
      product.hashCode ^
      board.hashCode ^
      build.hashCode ^
      javaVmVersion.hashCode ^
      security.hashCode ^
      baseband.hashCode ^
      serial.hashCode ^
      buildType.hashCode ^
      tags.hashCode ^
      incremental.hashCode ^
      fingerprint.hashCode ^
      fingerprintManufacture.hashCode ^
      fingerprintModel.hashCode ^
      defaultOrientation.hashCode ^
      bootloader.hashCode ^
      selinux.hashCode;
  }
}
