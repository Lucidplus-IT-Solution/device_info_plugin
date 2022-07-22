import 'dart:convert';

/// [SystemInfo] is information about the system.
class SystemInfo {
  /// [manufacture] is the name of manufacturer of the device.
  String manufacture;

  /// [model] is the name of model of the device.
  String model;

  /// [brand] is the name of brand of the device.
  String brand;

  /// [android] is the version of android of the device. i.e. android 8.1.0.
  String android;

  /// [apiLevel] is the api level of android of the device. i.e. api level 28.
  String apiLevel;

  /// [codeName] is the code name of android of the device. i.e. lollipop, marshmallow, etc.
  String codeName;

  /// [density] is the density of the device. i.e. 330.
  String density;

  /// [refreshRate] is the refresh rate of the device. i.e. 60,90,120.
  String refreshRate;

  /// [product] is the product name of the device. i.e. Google Pixel 3.
  String product;

  /// [board] is the board name of the device. i.e. samsung_msm8996.
  String board;

  /// [build] is the build number of the device.  refers to `android.os.Build.ID` e.g. LMY48G.
  String build;

  /// [javaVmVersion] is the java version of the device.Refers to `System.getProperty("java.vm.version")` e.g.2.1.0
  String javaVmVersion;

  /// [security] is the security patch level of the device. i.e. 2018-05-01.
  String security;

  /// [baseband] is the baseband version of the device. `Build.getRadioVersion()` e.g. Q_G964_V10.0.0.0.
  String baseband;

  /// [serial] is the serial number of the device. `Build.getSerial()`.e.g. A0YKZBJYXK.
  ///
  /// return security exceeption on error
  String serial;

  /// [buildType] is the build type of the device. i.e. release, debug,user etc.
  String buildType;

  /// [tags]  describing the build, like "unsigned,debug".
  String tags;

  /// [incremental] is the incremental build number of the device. i.e. 12345.
  String incremental;

  /// [fingerprint] is the fingerprint of the device. i.e. google/pixel3/google:6.0.1/NRD90M/4.4.2:user/release-keys.
  String fingerprint;

  /// [fingerprintManufacture] is the name of finger print manufacturer of the device. i.e. Goodix.
  String fingerprintManufacture;

  /// [fingerprintModel] is the name of finger print model of the device. i.e. FP.
  String fingerprintModel;

  ///[defaultOrientation] is the default Orientation of the device. i.e. portrait.
  String defaultOrientation;

  /// [bootloader] is the bootloader version of the device. i.e. G964V10.0.0.0.
  String bootloader;

  /// [selinux] is the selinux status of the device. i.e. enforcing.
  String selinux;

  /// constructor of [SystemInfo]
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

  /// [copyWith] is used to copy the [SystemInfo] object.
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
      fingerprintManufacture:
          fingerprintManufacture ?? this.fingerprintManufacture,
      fingerprintModel: fingerprintModel ?? this.fingerprintModel,
      defaultOrientation: defaultOrientation ?? this.defaultOrientation,
      bootloader: bootloader ?? this.bootloader,
      selinux: selinux ?? this.selinux,
    );
  }

  /// [toMap] returns a map of the object.
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

  /// [fromMap] returns a SystemInfo object from a map.
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

  /// [toJson] returns a json object of the object.
  String toJson() => json.encode(toMap());

  /// [fromJson] returns a SystemInfo object from a json object.
  factory SystemInfo.fromJson(String source) =>
      SystemInfo.fromMap(json.decode(source));

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
