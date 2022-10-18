// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_shadow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppShadow _$AppShadowFromJson(Map<String, dynamic> json) => AppShadow(
      name: json['name'] as String?,
      parent: json['parent'] as String?,
      description: json['description'] as String?,
      color: json['color'] as String?,
      offsetX: json['offsetX'] as int?,
      offsetY: json['offsetY'] as int?,
      radius: json['radius'] as int?,
      spread: json['spread'] as int?,
    );

Map<String, dynamic> _$AppShadowToJson(AppShadow instance) => <String, dynamic>{
      'name': instance.name,
      'parent': instance.parent,
      'description': instance.description,
      'color': instance.color,
      'offsetX': instance.offsetX,
      'offsetY': instance.offsetY,
      'radius': instance.radius,
      'spread': instance.spread,
    };
