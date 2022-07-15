import 'dart:convert';

class Memory {
  MemoryTypeInfo? ram;
  MemoryTypeInfo? internal;
  MemoryTypeInfo? external;
  Memory({
    this.ram,
    this.internal,
    this.external,
  });

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

  Map<String, dynamic> toMap() {
    return {
      'ram': ram?.toMap(),
      'internal': internal?.toMap(),
      'external': external?.toMap(),
    };
  }

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

  String toJson() => json.encode(toMap());

  factory Memory.fromJson(String source) => Memory.fromMap(json.decode(source));

  @override
  String toString() =>
      'Memorya(ram: $ram, internal: $internal, external: $external)';

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

class MemoryTypeInfo {
  String name;
  String used;
  String free;
  String total;
  MemoryTypeInfo({
    required this.name,
    required this.used,
    required this.free,
    required this.total,
  });

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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'used': used,
      'free': free,
      'total': total,
    };
  }

  factory MemoryTypeInfo.fromMap(Map<String, dynamic> map) {
    return MemoryTypeInfo(
      name: map['name'] ?? '',
      used: map['used'] ?? '',
      free: map['free'] ?? '',
      total: map['total'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

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
