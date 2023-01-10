// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:yaml/yaml.dart';

import '../utils/utils.dart';
import 'app_dimen.dart';

part 'app_config.g.dart';

@JsonSerializable(
  anyMap: true,
  checked: true,
  createToJson: false,
)
class AppConfig {
  @JsonKey(name: 'source_file_path', defaultValue: 'assets/styles.json')
  String sourceFilePath;

  @JsonKey(name: 'output_dir', defaultValue: 'lib/presentation/style')
  String outputDir;

  @JsonKey(name: 'colors_class_name', defaultValue: 'AppColors')
  String colorsClassName;

  @JsonKey(name: 'typography_class_name', defaultValue: 'AppTypography')
  String typographyClassName;

  @JsonKey(name: 'shadows_class_name', defaultValue: 'AppShadows')
  String shadowsClassName;

  @JsonKey(name: 'dimens_class_name', defaultValue: 'AppDimens')
  String dimensClassName;

  @JsonKey(name: 'generate_colors', defaultValue: true)
  bool generateColors;

  @JsonKey(name: 'generate_typography', defaultValue: true)
  bool generateTypography;

  @JsonKey(name: 'generate_shadows', defaultValue: true)
  bool generateShadows;

  @JsonKey(name: 'generate_dimens', defaultValue: true)
  bool generateDimens;

  @JsonKey(
    defaultValue: [],
    fromJson: DimensConverter.fromJson,
  )
  List<AppDimen> dimens;

  AppConfig({
    required this.sourceFilePath,
    required this.outputDir,
    required this.colorsClassName,
    required this.typographyClassName,
    required this.shadowsClassName,
    required this.dimensClassName,
    required this.generateColors,
    required this.generateTypography,
    required this.generateShadows,
    required this.generateDimens,
    required this.dimens,
  });

  String get outputFileColors => getFileNameFromClassName(colorsClassName);
  String get outputFileTypography => getFileNameFromClassName(typographyClassName);
  String get outputFileShadows => getFileNameFromClassName(shadowsClassName);
  String get outputFileDimens => getFileNameFromClassName(dimensClassName);

  factory AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);

  static AppConfig loadConfigFromPath(String filePath) {
    final config = File(filePath);

    if (!config.existsSync()) return AppConfig.fromJson({});

    final configContent = config.readAsStringSync();
    final yamlMap = loadYaml(configContent);
    final jsonString = json.encode(yamlMap);

    return AppConfig.fromJson(json.decode(jsonString)['figma_generator']);
  }
}

class DimensConverter {
  const DimensConverter._();

  static List<AppDimen> fromJson(Map<String, dynamic> json) {
    try {
      var appDimens = <AppDimen>[];

      for (final map in json.entries) {
        appDimens.add(AppDimen(value: double.parse(map.value.toString()), name: map.key));
      }

      return appDimens;
    } catch (e) {
      printError(e.toString());
      return [];
    }
  }
}
