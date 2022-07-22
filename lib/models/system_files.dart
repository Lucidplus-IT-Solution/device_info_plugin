import 'dart:convert';

/// [SystemFiles] is information about the system files.
class SystemFiles {
  /// [cpuInfo] is information about the CPU.
  SystemType cpuInfo;

  /// [hosts] is information about the hosts.
  SystemType hosts;

  /// [memoryInfo] is information about the memory.
  SystemType memoryInfo;

  /// constructor for the class.
  SystemFiles({
    required this.cpuInfo,
    required this.hosts,
    required this.memoryInfo,
  });

  /// [copyWith] is the method to copy the class.
  SystemFiles copyWith({
    SystemType? cpuInfo,
    SystemType? hosts,
    SystemType? memoryInfo,
  }) {
    return SystemFiles(
      cpuInfo: cpuInfo ?? this.cpuInfo,
      hosts: hosts ?? this.hosts,
      memoryInfo: memoryInfo ?? this.memoryInfo,
    );
  }

  /// [toMap] returns a map of the object.
  Map<String, dynamic> toMap() {
    return {
      'cpuInfo': cpuInfo.toMap(),
      'hosts': hosts.toMap(),
      'memoryInfo': memoryInfo.toMap(),
    };
  }

  /// [fromMap] returns instance of [SystemFiles] from a map.
  factory SystemFiles.fromMap(Map<String, dynamic> map) {
    return SystemFiles(
      cpuInfo: SystemType.fromMap(map['cpuInfo']),
      hosts: SystemType.fromMap(map['hosts']),
      memoryInfo: SystemType.fromMap(map['memoryInfo']),
    );
  }

  ///[toJson] returns a json string of the object.
  String toJson() => json.encode(toMap());

  ///[fromJson] returns a instance of [SystemFiles] from a json string.
  factory SystemFiles.fromJson(String source) =>
      SystemFiles.fromMap(json.decode(source));

  @override
  String toString() =>
      'SystemFiles(cpuInfo: $cpuInfo, hosts: $hosts, memoryInfo: $memoryInfo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SystemFiles &&
        other.cpuInfo == cpuInfo &&
        other.hosts == hosts &&
        other.memoryInfo == memoryInfo;
  }

  @override
  int get hashCode => cpuInfo.hashCode ^ hosts.hashCode ^ memoryInfo.hashCode;
}

class SystemType {
  /// [name] The name of the system file.
  String name;

  /// [path] The path of the system file.
  String path;

  /// [content] The resultant info of the system file.
  String? content;

  /// constructor for the class.
  SystemType({
    required this.name,
    required this.path,
    this.content,
  });

  /// [copyWith] is the method to copy the class.
  SystemType copyWith({
    String? name,
    String? path,
    String? content,
  }) {
    return SystemType(
      name: name ?? this.name,
      path: path ?? this.path,
      content: content ?? this.content,
    );
  }

  /// [toMap] converts this object to a map.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'path': path,
      'content': content,
    };
  }

  /// [fromMap] converts a map to a [SystemType] object.
  factory SystemType.fromMap(Map<String, dynamic> map) {
    return SystemType(
      name: map['name'] ?? '',
      path: map['path'] ?? '',
      content: map['content'],
    );
  }

  /// [toJson] converts this object to a json string.
  String toJson() => json.encode(toMap());

  /// [fromJson] converts a json string to a [SystemType] object.
  factory SystemType.fromJson(String source) =>
      SystemType.fromMap(json.decode(source));

  @override
  String toString() =>
      'SystemType(name: $name, path: $path, content: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SystemType &&
        other.name == name &&
        other.path == path &&
        other.content == content;
  }

  @override
  int get hashCode => name.hashCode ^ path.hashCode ^ content.hashCode;
}
