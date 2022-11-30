// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:path/path.dart' as path;
import 'src/models/app_config.dart';
import 'src/models/app_dimen.dart';
import 'src/templates/class_color_template.dart';
import 'src/templates/class_dimens_template.dart';
import 'src/templates/class_shadow_template.dart';
import 'src/templates/class_typography_template.dart';
import 'src/utils/utils.dart';

const String defaultConfigFile = "figma_generator.yaml";

Future<void> main(List<String> args) async {
  if (_isHelpCommand(args)) {
    _printHelperDisplay();
  } else {
    await _handleStyleFiles(_generateOption(args));
  }
}

bool _isHelpCommand(List<String> args) {
  return args.length == 1 && (args[0] == '--help' || args[0] == '-h');
}

void _printHelperDisplay() {
  final parser = _generateArgParser(null);
  printInfo(parser.usage);
}

AppConfig _loadConfigFile(String? path) {
  return AppConfig.loadConfigFromPath(path ?? defaultConfigFile);
}

GenerateOptions _generateOption(List<String> args) {
  final generateOptions = GenerateOptions();
  _generateArgParser(generateOptions).parse(args);

  return generateOptions;
}

ArgParser _generateArgParser(GenerateOptions? generateOptions) {
  final parser = ArgParser();

  parser.addOption(
    'config',
    abbr: 'f',
    defaultsTo: 'figma_generator.yaml',
    callback: (String? x) => generateOptions!.config = x,
    help: 'Config file path',
  );

  return parser;
}

class GenerateOptions {
  String? config;
}

Future<void> _handleStyleFiles(GenerateOptions options) async {
  final current = Directory.current;

  AppConfig appConfig = _loadConfigFile(options.config);

  final sourceFile = File(path.join(current.path, appConfig.sourceFilePath));

  final outputFileColors = File(
      path.join(current.path, appConfig.outputDir, appConfig.outputFileColors));
  final outputFileTypography = File(path.join(
      current.path, appConfig.outputDir, appConfig.outputFileTypography));
  final outputFileShadows = File(path.join(
      current.path, appConfig.outputDir, appConfig.outputFileShadows));
  final outputFileDimens = File(
      path.join(current.path, appConfig.outputDir, appConfig.outputFileDimens));

  if (!await sourceFile.exists()) {
    printError('Source file does not exist (${sourceFile.toString()})');
    return;
  }

  final dynamic data = json.decode(await sourceFile.readAsString());

  if (data is Map<String, dynamic>) {
    if (appConfig.generateColors) {
      await _generateFile(
        data['color'],
        outputFileColors,
        appConfig.colorsClassName,
        'colors',
      );
    }

    if (appConfig.generateTypography) {
      await _generateFile(
        data['font'],
        outputFileTypography,
        appConfig.typographyClassName,
        'fonts',
      );
    }

    if (appConfig.generateShadows) {
      await _generateFile(
        data['effect'],
        outputFileShadows,
        appConfig.shadowsClassName,
        'effect',
      );
    }
  }

  if (appConfig.generateDimens) {
    await _generateFile(
      {"dimens": appConfig.dimens},
      outputFileDimens,
      appConfig.dimensClassName,
      'dimens',
    );
  }
}

Future<void> _generateFile(
  Map<String, dynamic>? data,
  File outputPath,
  String className,
  String type,
) async {
  if (data == null) return printError('Not found $type data');

  printInfo("Generating a $className class...");

  final generatedFile = File(outputPath.path);

  if (!generatedFile.existsSync()) {
    generatedFile.createSync(recursive: true);
  }

  final classBuilder = StringBuffer();

  if (type == 'colors') {
    await _generateColorClass(classBuilder, data, className);
  } else if (type == 'fonts') {
    await _generateTypographyClass(classBuilder, data, className);
  } else if (type == 'effect') {
    await _generateShadowClass(classBuilder, data, className);
  } else if (type == 'dimens') {
    _generateDimensClass(classBuilder, data['dimens'], className);
  }

  classBuilder.writeln('}');
  generatedFile.writeAsStringSync(classBuilder.toString());

  printInfo('All done! File generated in ${outputPath.path}');
}

Future _generateColorClass(
  StringBuffer classBuilder,
  Map<String, dynamic> data,
  String className,
) async {
  classBuilder.write(
    await ClassColorTemplate(
      className: className,
      data: data,
    ).generate(),
  );
}

Future _generateTypographyClass(
  StringBuffer classBuilder,
  Map<String, dynamic> data,
  String className,
) async {
  classBuilder.write(
    await ClassTypographyTemplate(
      className: className,
      data: data,
    ).generate(),
  );
}

Future _generateShadowClass(
  StringBuffer classBuilder,
  Map<String, dynamic> data,
  String className,
) async {
  classBuilder.write(
    await ClassShadowTemplate(
      className: className,
      data: data,
    ).generate(),
  );
}

void _generateDimensClass(
  StringBuffer classBuilder,
  List<AppDimen> data,
  String className,
) {
  classBuilder.write(
    ClassAppDimensTemplate(
      className: className,
      data: data,
    ).generate(),
  );
}
