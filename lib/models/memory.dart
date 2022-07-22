import 'dart:convert';

class Memory {
  /// [ram] is the information about the ram.
  MemoryTypeInfo? ram;

  /// [internal] is the information about the internal.
  MemoryTypeInfo? internal;

  /// [external] is the information about the external.
  MemoryTypeInfo? external;

  /// constructor for the memory class.
  Memory({
    this.ram,
    this.internal,
    this.external,
  });

  /// [copyWith] is the method to copy the class.
  Memory copyWith({
    MemoryTypeInfo? ram,
    MemoryTypeInfo? internal,
    MemoryTypeInfo? external,
  }) {
    return Memory(
      ram: ram ?? this.ram,
      internal: internal ?? this.internal,
      external: external ?? this.external,
    );
  }

  /// [toMap] returns a map of the object.
  Map<String, dynamic> toMap() {
    return {
      'ram': ram?.toMap(),
      'internal': internal?.toMap(),
      'external': external?.toMap(),
    };
  }

  /// [fromMap] returns instance of [Memory] from a map.
  factory Memory.fromMap(Map<String, dynamic> map) {
    return Memory(
      ram: map['ram'] != null ? MemoryTypeInfo.fromMap(map['ram']) : null,
      internal: map['internal'] != null
          ? MemoryTypeInfo.fromMap(map['internal'])
          : null,
      external: map['external'] != null
          ? MemoryTypeInfo.fromMap(map['external'])
          : null,
    );
  }

  /// [toJson] returns a json string of the object.
  String toJson() => json.encode(toMap());

  /// [fromJson] returns a instance of [Memory] from a json string.
  factory Memory.fromJson(String source) => Memory.fromMap(json.decode(source));

  @override
  String toString() =>
      'Memory(ram: $ram, internal: $internal, external: $external)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Memory &&
        other.ram == ram &&
        other.internal == internal &&
        other.external == external;
  }

  @override
  int get hashCode => ram.hashCode ^ internal.hashCode ^ external.hashCode;
}

/// [MemoryTypeInfo] includes the memory type name and the size in MB.
class MemoryTypeInfo {
  /// [name] is the name of the memory type.
  String name;

  /// [used] is the amount of memory used in MB.
  String used;

  /// [free] is the amount of memory free in MB.
  String free;

  /// [total] is the total amount of memory in MB.
  String total;

  /// constructor for the memory type info class.
  MemoryTypeInfo({
    required this.name,
    required this.used,
    required this.free,
    required this.total,
  });
 /// [copyWith] is the method to copy the class.
  MemoryTypeInfo copyWith({
    String? name,
    String? used,
    String? free,
    String? total,
  }) {
    return MemoryTypeInfo(
      name: name ?? this.name,
      used: used ?? this.used,
      free: free ?? this.free,
      total: total ?? this.total,
    );
  }

  /// [toMap] returns the map of memory type info.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'used': used,
      'free': free,
      'total': total,
    };
  }

  /// [fromMap] returns [MemoryTypeInfo] from map.
  factory MemoryTypeInfo.fromMap(Map<String, dynamic> map) {
    return MemoryTypeInfo(
      name: map['name'] ?? '',
      used: map['used'] ?? '',
      free: map['free'] ?? '',
      total: map['total'] ?? '',
    );
  }

  /// [toJson] returns the json string of memory type info.
  String toJson() => json.encode(toMap());

  /// [fromJson] returns [MemoryTypeInfo] from json string.
  factory MemoryTypeInfo.fromJson(String source) =>
      MemoryTypeInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MemoryTypeInfo(name: $name, used: $used, free: $free, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MemoryTypeInfo &&
        other.name == name &&
        other.used == used &&
        other.free == free &&
        other.total == total;
  }

  @override
  int get hashCode {
    return name.hashCode ^ used.hashCode ^ free.hashCode ^ total.hashCode;
  }
}
