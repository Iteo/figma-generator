// ignore_for_file: public_member_api_docs, sort_constructors_first
enum AssetModelType { image, svg, audio, json, other }

class AssetModel {
  final String path;
  final String ext;
  final AssetModelType type;
  final String name;
  final String size;

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
    String? size,
  }) {
    return AssetModel(
      path: path ?? this.path,
      ext: ext ?? this.ext,
      type: type ?? this.type,
      name: name ?? this.name,
      size: size ?? this.size,
    );
  }
}
