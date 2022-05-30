import 'dart:convert';

class SystemFiles {
  SystemType cpuInfo;
  SystemType hosts;
  SystemType memoryInfo;
  SystemFiles({
    required this.cpuInfo,
    required this.hosts,
    required this.memoryInfo,
  });

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

  Map<String, dynamic> toMap() {
    return {
      'cpuInfo': cpuInfo.toMap(),
      'hosts': hosts.toMap(),
      'memoryInfo': memoryInfo.toMap(),
    };
  }

  factory SystemFiles.fromMap(Map<String, dynamic> map) {
    return SystemFiles(
      cpuInfo: SystemType.fromMap(map['cpuInfo']),
      hosts: SystemType.fromMap(map['hosts']),
      memoryInfo: SystemType.fromMap(map['memoryInfo']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SystemFiles.fromJson(String source) => SystemFiles.fromMap(json.decode(source));

  @override
  String toString() => 'SystemFiles(cpuInfo: $cpuInfo, hosts: $hosts, memoryInfo: $memoryInfo)';

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
  String name;
  String path;
  String? content;
  SystemType({
    required this.name,
    required this.path,
    this.content,
  });

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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'path': path,
      'content': content,
    };
  }

  factory SystemType.fromMap(Map<String, dynamic> map) {
    return SystemType(
      name: map['name'] ?? '',
      path: map['path'] ?? '',
      content: map['content'],
    );
  }

  String toJson() => json.encode(toMap());

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
