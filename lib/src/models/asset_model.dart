enum AssetModelType { image, svg, audio, json, other }

class AssetModel {
  final String path;
  final String ext;
  final AssetModelType type;
  final String name;
  final double size;

  AssetModel({
    required this.path,
    required this.ext,
    required this.type,
    required this.name,
    required this.size,
  });

  AssetModel copyWith({
    String? path,
    String? ext,
    AssetModelType? type,
    String? name,
    double? size,
  }) {
    return AssetModel(
      path: path ?? this.path,
      ext: ext ?? this.ext,
      type: type ?? this.type,
      name: name ?? this.name,
      size: size ?? this.size,
    );
  }

  @override
  String toString() {
    return 'AssetModel(path: $path, ext: $ext, type: $type, name: $name, size: $size)';
  }

  @override
  bool operator ==(covariant AssetModel other) {
    if (identical(this, other)) return true;

    return other.path == path && other.ext == ext && other.type == type && other.name == name && other.size == size;
  }

  @override
  int get hashCode {
    return path.hashCode ^ ext.hashCode ^ type.hashCode ^ name.hashCode ^ size.hashCode;
  }
}
