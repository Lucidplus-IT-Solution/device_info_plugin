import 'dart:convert';

/// [Android] is the class for android information.
class Android {
  /// [androidversion] is the version of the android i.e. 6.0.1.
  String? androidversion;

  /// [apiLevel] is the api level of the android i.e. 23.
  int? apiLevel;

  /// [androidSecurityPatchLevel] is the security patch level of the android.
  String? androidSecurityPatchLevel;

  /// [isDeviceRooted] is the boolean value to check if the device is rooted or not.
  bool? isDeviceRooted;

  /// [androidId] is the android id of the device.
  String? androidId;

  /// [baseband] is the baseband of the android.
  String? baseband;

  /// [bootloader] is the bootloader of the android.
  String? bootloader;

  /// [buildId] is the build id of the android.
  String? buildId;

  /// [codeName] is the code name of the android.
  String? codeName;

  /// [fingerprint] is the fingerprint of the android.
  String? fingerprint;

  /// [id] is the id of the android.
  String? id;

  /// [incremental] is the incremental of the android.
  String? incremental;

  /// [javaRuntimeVersion] is the java runtime version of the android.
  String? javaRuntimeVersion;

  /// [javaVmVersion] is the java vm version of the android.
  String? javaVmVersion;

  /// [javaHeapSize] is the java heap size of the android.
  String? javaHeapSize;

  /// [kernelArchitecture] is the kernel architecture of the android.
  String? kernelArchitecture;

  /// [kernelVersion] is the kernel version of the android.
  String? kernelVersion;

  /// [tags] is the tags of the android.
  String? tags;

  /// [buildType] is the build type of the android.
  String? buildType;

  /// [googlePlayServiceVersion] is the google play service version of the android.
  String? googlePlayServiceVersion;

  /// [opensslVersion] is the openssl version of the android.
  String? opensslVersion = "";

  /// [zlibVersion] is the zlib version of the android.
  String? zlibVersion = "";

  /// [icuCldrVersion] is the icu cldr version of the android.
  String? icuCldrVersion = "";

  /// [icuLibraryVersion] is the icu library version of the android.
  String? icuLibraryVersion = "";

  /// [icuUnicodeVersion] is the icu unicode version of the android.
  String? icuUnicodeVersion = "";

  /// [androidLanguage] is the language of the android.
  String? androidLanguage = "";

  /// [configuredTimeZone] is the configured time zone of the android.
  String? configuredTimeZone = "";

  /// constructor to initialize the android information.
  Android({
    this.androidversion,
    this.apiLevel,
    this.androidSecurityPatchLevel,
    this.isDeviceRooted,
    this.androidId,
    this.baseband,
    this.bootloader,
    this.buildId,
    this.codeName,
    this.fingerprint,
    this.id,
    this.incremental,
    this.javaRuntimeVersion,
    this.javaVmVersion,
    this.javaHeapSize,
    this.kernelArchitecture,
    this.kernelVersion,
    this.tags,
    this.buildType,
    this.googlePlayServiceVersion,
    this.opensslVersion,
    this.zlibVersion,
    this.icuCldrVersion,
    this.icuLibraryVersion,
    this.icuUnicodeVersion,
    this.androidLanguage,
    this.configuredTimeZone,
  });

  /// [copyWith] is the function to copy the android information.
  Android copyWith({
    String? androidversion,
    int? apiLevel,
    String? androidSecurityPatchLevel,
    bool? isDeviceRooted,
    String? androidId,
    String? baseband,
    String? bootloader,
    String? buildId,
    String? codeName,
    String? fingerprint,
    String? id,
    String? incremental,
    String? javaRuntimeVersion,
    String? javaVmVersion,
    String? javaHeapSize,
    String? kernelArchitecture,
    String? kernelVersion,
    String? tags,
    String? buildType,
    String? googlePlayServiceVersion,
    String? opensslVersion,
    String? zlibVersion,
    String? icuCldrVersion,
    String? icuLibraryVersion,
    String? icuUnicodeVersion,
    String? androidLanguage,
    String? configuredTimeZone,
  }) {
    return Android(
      androidversion: androidversion ?? this.androidversion,
      apiLevel: apiLevel ?? this.apiLevel,
      androidSecurityPatchLevel:
          androidSecurityPatchLevel ?? this.androidSecurityPatchLevel,
      isDeviceRooted: isDeviceRooted ?? this.isDeviceRooted,
      androidId: androidId ?? this.androidId,
      baseband: baseband ?? this.baseband,
      bootloader: bootloader ?? this.bootloader,
      buildId: buildId ?? this.buildId,
      codeName: codeName ?? this.codeName,
      fingerprint: fingerprint ?? this.fingerprint,
      id: id ?? this.id,
      incremental: incremental ?? this.incremental,
      javaRuntimeVersion: javaRuntimeVersion ?? this.javaRuntimeVersion,
      javaVmVersion: javaVmVersion ?? this.javaVmVersion,
      javaHeapSize: javaHeapSize ?? this.javaHeapSize,
      kernelArchitecture: kernelArchitecture ?? this.kernelArchitecture,
      kernelVersion: kernelVersion ?? this.kernelVersion,
      tags: tags ?? this.tags,
      buildType: buildType ?? this.buildType,
      googlePlayServiceVersion:
          googlePlayServiceVersion ?? this.googlePlayServiceVersion,
      opensslVersion: opensslVersion ?? this.opensslVersion,
      zlibVersion: zlibVersion ?? this.zlibVersion,
      icuCldrVersion: icuCldrVersion ?? this.icuCldrVersion,
      icuLibraryVersion: icuLibraryVersion ?? this.icuLibraryVersion,
      icuUnicodeVersion: icuUnicodeVersion ?? this.icuUnicodeVersion,
      androidLanguage: androidLanguage ?? this.androidLanguage,
      configuredTimeZone: configuredTimeZone ?? this.configuredTimeZone,
    );
  }

  /// [toMap] is the map representation of the android.
  Map<String, dynamic> toMap() {
    return {
      'androidversion': androidversion,
      'apiLevel': apiLevel,
      'androidSecurityPatchLevel': androidSecurityPatchLevel,
      'isDeviceRooted': isDeviceRooted,
      'androidId': androidId,
      'baseband': baseband,
      'bootloader': bootloader,
      'buildId': buildId,
      'codeName': codeName,
      'fingerprint': fingerprint,
      'id': id,
      'incremental': incremental,
      'javaRuntimeVersion': javaRuntimeVersion,
      'javaVmVersion': javaVmVersion,
      'javaHeapSize': javaHeapSize,
      'kernelArchitecture': kernelArchitecture,
      'kernelVersion': kernelVersion,
      'tags': tags,
      'buildType': buildType,
      'googlePlayServiceVersion': googlePlayServiceVersion,
      'opensslVersion': opensslVersion,
      'zlibVersion': zlibVersion,
      'icuCldrVersion': icuCldrVersion,
      'icuLibraryVersion': icuLibraryVersion,
      'icuUnicodeVersion': icuUnicodeVersion,
      'androidLanguage': androidLanguage,
      'configuredTimeZone': configuredTimeZone,
    };
  }

  /// [fromMap] is the map representation of the android.
  factory Android.fromMap(Map<String, dynamic> map) {
    return Android(
      androidversion: map['androidversion'],
      apiLevel: map['apiLevel']?.toInt(),
      androidSecurityPatchLevel: map['androidSecurityPatchLevel'],
      isDeviceRooted: map['isDeviceRooted'],
      androidId: map['androidId'],
      baseband: map['baseband'],
      bootloader: map['bootloader'],
      buildId: map['buildId'],
      codeName: map['codeName'],
      fingerprint: map['fingerprint'],
      id: map['id'],
      incremental: map['incremental'],
      javaRuntimeVersion: map['javaRuntimeVersion'],
      javaVmVersion: map['javaVmVersion'],
      javaHeapSize: map['javaHeapSize'],
      kernelArchitecture: map['kernelArchitecture'],
      kernelVersion: map['kernelVersion'],
      tags: map['tags'],
      buildType: map['buildType'],
      googlePlayServiceVersion: map['googlePlayServiceVersion'],
      opensslVersion: map['opensslVersion'],
      zlibVersion: map['zlibVersion'],
      icuCldrVersion: map['icuCldrVersion'],
      icuLibraryVersion: map['icuLibraryVersion'],
      icuUnicodeVersion: map['icuUnicodeVersion'],
      androidLanguage: map['androidLanguage'],
      configuredTimeZone: map['configuredTimeZone'],
    );
  }

  /// [toJson] is the json representation of the android.
  String toJson() => json.encode(toMap());

  /// [fromJson] is the json representation of the android.
  factory Android.fromJson(String source) =>
      Android.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Android(androidversion: $androidversion, apiLevel: $apiLevel, androidSecurityPatchLevel: $androidSecurityPatchLevel, isDeviceRooted: $isDeviceRooted, androidId: $androidId, baseband: $baseband, bootloader: $bootloader, buildId: $buildId, codeName: $codeName, fingerprint: $fingerprint, id: $id, incremental: $incremental, javaRuntimeVersion: $javaRuntimeVersion, javaVmVersion: $javaVmVersion, javaHeapSize: $javaHeapSize, kernelArchitecture: $kernelArchitecture, kernelVersion: $kernelVersion, tags: $tags, buildType: $buildType, googlePlayServiceVersion: $googlePlayServiceVersion, opensslVersion: $opensslVersion, zlibVersion: $zlibVersion, icuCldrVersion: $icuCldrVersion, icuLibraryVersion: $icuLibraryVersion, icuUnicodeVersion: $icuUnicodeVersion, androidLanguage: $androidLanguage, configuredTimeZone: $configuredTimeZone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Android &&
        other.androidversion == androidversion &&
        other.apiLevel == apiLevel &&
        other.androidSecurityPatchLevel == androidSecurityPatchLevel &&
        other.isDeviceRooted == isDeviceRooted &&
        other.androidId == androidId &&
        other.baseband == baseband &&
        other.bootloader == bootloader &&
        other.buildId == buildId &&
        other.codeName == codeName &&
        other.fingerprint == fingerprint &&
        other.id == id &&
        other.incremental == incremental &&
        other.javaRuntimeVersion == javaRuntimeVersion &&
        other.javaVmVersion == javaVmVersion &&
        other.javaHeapSize == javaHeapSize &&
        other.kernelArchitecture == kernelArchitecture &&
        other.kernelVersion == kernelVersion &&
        other.tags == tags &&
        other.buildType == buildType &&
        other.googlePlayServiceVersion == googlePlayServiceVersion &&
        other.opensslVersion == opensslVersion &&
        other.zlibVersion == zlibVersion &&
        other.icuCldrVersion == icuCldrVersion &&
        other.icuLibraryVersion == icuLibraryVersion &&
        other.icuUnicodeVersion == icuUnicodeVersion &&
        other.androidLanguage == androidLanguage &&
        other.configuredTimeZone == configuredTimeZone;
  }

  @override
  int get hashCode {
    return androidversion.hashCode ^
        apiLevel.hashCode ^
        androidSecurityPatchLevel.hashCode ^
        isDeviceRooted.hashCode ^
        androidId.hashCode ^
        baseband.hashCode ^
        bootloader.hashCode ^
        buildId.hashCode ^
        codeName.hashCode ^
        fingerprint.hashCode ^
        id.hashCode ^
        incremental.hashCode ^
        javaRuntimeVersion.hashCode ^
        javaVmVersion.hashCode ^
        javaHeapSize.hashCode ^
        kernelArchitecture.hashCode ^
        kernelVersion.hashCode ^
        tags.hashCode ^
        buildType.hashCode ^
        googlePlayServiceVersion.hashCode ^
        opensslVersion.hashCode ^
        zlibVersion.hashCode ^
        icuCldrVersion.hashCode ^
        icuLibraryVersion.hashCode ^
        icuUnicodeVersion.hashCode ^
        androidLanguage.hashCode ^
        configuredTimeZone.hashCode;
  }
}
