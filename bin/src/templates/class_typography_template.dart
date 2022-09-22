import '../models/app_typography.dart';
import '../utils/utils.dart';

class ClassTypographyTemplate {
  ClassTypographyTemplate({
    required this.className,
    required this.data,
  });

  final String className;
  final Map<String, dynamic> data;

  Future<String> generate() async {
    return '''
${_importsGenerate()}

${await _classGenerate()}
''';
  }

  String _importsGenerate() {
    return '''
import 'package:flutter/material.dart';
''';
  }

  Future<String> _classGenerate() async {
    return '''
class $className {
const $className._();

${await _generateTypographyBody()}
''';
  }

  Future<List<AppTypography>> _parseJson() async {
    final typographyList = <AppTypography>[];

    data.map((key, value) {
      if (value is! Map<String, dynamic>) return MapEntry(key, value);

      var appTypography = AppTypography.fromJson(value['value']);

      appTypography = appTypography.copyWith(
        name: _getTypographyName(key),
        description: key,
      );

      typographyList.add(appTypography);

      return MapEntry(key, value);
    });

    return typographyList;
  }

  Future<String> _generateTypographyBody() async {
    final typographyList = await _parseJson();
    final buffer = StringBuffer();

    buffer.writeln(_generateTypographyMaps(typographyList));

    for (final typography in typographyList) {
      buffer.writeln(
        '\nstatic const TextStyle ${typography.name!} = TextStyle(${typographyParser(typography)});',
      );
    }

    return buffer.toString();
  }

  String _generateTypographyMaps(List<AppTypography> typography) {
    final buffer = StringBuffer();

    buffer.writeln('\nstatic Map<String, TextStyle> get allStyles => {');

    typography.sort((a, b) => a.name?.compareTo(b.name ?? '') ?? typography.length);

    for (final typo in typography) {
      buffer.writeln('"${typo.description}": ${typo.name},');
    }

    buffer.writeln("};");

    return buffer.toString();
  }

  String _getTypographyName(String name) {
    return name.replaceAll(RegExp("[^A-Za-z0-9]"), "").replaceAll(" ", "");
  }
}
