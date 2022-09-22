import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:args/args.dart';
import 'package:path/path.dart' as path;
import 'src/templates/class_color_template.dart';
import 'src/templates/class_dimens_template.dart';
import 'src/templates/class_typography_template.dart';
import 'src/utils/utils.dart';

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
  log(parser.usage);
}

GenerateOptions _generateOption(List<String> args) {
  final generateOptions = GenerateOptions();
  _generateArgParser(generateOptions).parse(args);

  return generateOptions;
}

ArgParser _generateArgParser(GenerateOptions? generateOptions) {
  final parser = ArgParser();

  parser.addOption(
    'source-dir',
    abbr: 'S',
    defaultsTo: 'assets',
    callback: (String? x) => generateOptions!.sourceDir = x,
    help: 'Folder containing styles files',
  );

  parser.addOption(
    'source-file',
    abbr: 'F',
    defaultsTo: 'styles.json',
    callback: (String? x) => generateOptions!.sourceFile = x,
    help: 'File with color and font styles',
  );

  parser.addOption(
    'output-dir',
    abbr: 'O',
    defaultsTo: 'lib/presentation/style',
    callback: (String? x) => generateOptions!.outputDir = x,
    help: 'Output folder for the generated file',
  );

  parser.addOption(
    'output-file-colors',
    abbr: 'c',
    defaultsTo: 'app_colors.dart',
    callback: (String? x) => generateOptions!.outputFileColors = x,
    help: 'Output colors file name',
  );

  parser.addOption(
    'output-file-typography',
    abbr: 't',
    defaultsTo: 'app_typography.dart',
    callback: (String? x) => generateOptions!.outputFileTypography = x,
    help: 'Output typography file name',
  );

  parser.addOption(
    'output-file-dimens',
    abbr: 'd',
    defaultsTo: 'app_dimens.dart',
    callback: (String? x) => generateOptions!.outputFileDimens = x,
    help: 'Output dimens file name',
  );

  return parser;
}

class GenerateOptions {
  String? sourceDir;
  String? sourceFile;
  String? templateLocale;
  String? outputDir;
  String? outputFileColors;
  String? outputFileTypography;
  String? outputFileDimens;
}

Future<void> _handleStyleFiles(GenerateOptions options) async {
  final current = Directory.current;
  final source = Directory.fromUri(Uri.parse(options.sourceDir!));
  final output = Directory.fromUri(Uri.parse(options.outputDir!));
  final sourcePath = Directory(path.join(current.path, source.path));

  final outputFileColors = Directory(path.join(current.path, output.path, options.outputFileColors));
  final outputFileTypography = Directory(path.join(current.path, output.path, options.outputFileTypography));
  final outputFileDimens = Directory(path.join(current.path, output.path, options.outputFileDimens));

  if (!await sourcePath.exists()) {
    printError('Source path does not exist');
    return;
  }

  var files = await dirContents(sourcePath);

  if (options.sourceFile != null) {
    final sourceFile = File(path.join(source.path, options.sourceFile));
    if (!await sourceFile.exists()) {
      printError('Source file does not exist (${sourceFile.toString()})');
      return;
    }
    files = [sourceFile];
  } else {
    files = files.where((f) => f.path.contains('styles.json')).toList();
  }

  if (files.isNotEmpty) {
    final fileData = File(files.first.path);
    final dynamic data = json.decode(await fileData.readAsString());

    if (data is Map<String, dynamic>) {
      if (data['color'] != null) {
        await _generateFile(
          data['color'],
          outputFileColors,
          getClassName(outputFileColors),
          'colors',
        );
      } else {
        printError('Not found colors data');
      }

      if (data['font'] != null) {
        await _generateFile(
          data['font'],
          outputFileTypography,
          getClassName(outputFileTypography),
          'fonts',
        );
      } else {
        printError('Not found font style data');
      }
    }
  } else {
    printError('Source path empty');
  }

  await _generateFile(
    {},
    outputFileDimens,
    getClassName(outputFileDimens),
    '',
  );
}

String getClassName(Directory fileName) {
  return fileName.path
      .split("/")
      .last
      .split("_")
      .map((e) => e.substring(0, 1).toUpperCase() + e.substring(1))
      .join()
      .split('.dart')[0];
}

Future<List<FileSystemEntity>> dirContents(Directory dir) {
  final files = <FileSystemEntity>[];
  final completer = Completer<List<FileSystemEntity>>();

  dir.list().listen(
        files.add,
        onDone: () => completer.complete(files),
      );

  return completer.future;
}

Future<void> _generateFile(
  Map<String, dynamic> data,
  Directory outputPath,
  String className,
  String type,
) async {
  final generatedFile = File(outputPath.path);
  if (!generatedFile.existsSync()) {
    generatedFile.createSync(recursive: true);
  }

  final classBuilder = StringBuffer();

  if (type == 'colors') {
    await _generateColorClass(classBuilder, data, className);
  } else if (type == 'fonts') {
    await _generateTypographyClass(classBuilder, data, className);
  } else {
    _generateDimensClass(classBuilder, className);
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

void _generateDimensClass(
  StringBuffer classBuilder,
  String className,
) {
  classBuilder.write(ClassAppDimensTemplate().generate(className));
}
