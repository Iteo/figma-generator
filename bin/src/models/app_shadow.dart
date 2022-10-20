// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'app_shadow.g.dart';

@JsonSerializable()
class AppShadow {
  factory AppShadow.fromJson(Map<String, dynamic> json) => _$AppShadowFromJson(json);

  AppShadow({
    this.name,
    this.parent,
    this.description,
    this.color,
    this.offsetX,
    this.offsetY,
    this.radius,
    this.spread,
  });

  final String? name;
  final String? parent;
  final String? description;
  final String? color;
  final int? offsetX;
  final int? offsetY;
  final int? radius;
  final int? spread;

  Map<String, dynamic> toJson() => _$AppShadowToJson(this);

  AppShadow copyWith({
    String? name,
    String? parent,
    String? description,
    String? color,
    int? offsetX,
    int? offsetY,
    int? radius,
    int? spread,
  }) {
    return AppShadow(
      name: name ?? this.name,
      parent: parent ?? this.parent,
      description: description ?? this.description,
      color: color ?? this.color,
      offsetX: offsetX ?? this.offsetX,
      offsetY: offsetY ?? this.offsetY,
      radius: radius ?? this.radius,
      spread: spread ?? this.spread,
    );
  }
}
