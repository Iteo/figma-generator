import '../models/app_shadow.dart';
import '../utils/utils.dart';

class ClassShadowTemplate {
  ClassShadowTemplate({
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

${await _generateShadowBody()}
''';
  }

  Future<List<AppShadow>> _parseJson() async {
    final shadowList = <AppShadow>[];

    data.map((key, value) {
      if (value is! Map<String, dynamic>) return MapEntry(key, value);

      var appShadow = AppShadow.fromJson(value['value']);

      appShadow = appShadow.copyWith(
        name: _getShadowName(key),
        description: key,
      );

      shadowList.add(appShadow);

      return MapEntry(key, value);
    });

    return shadowList;
  }

  Future<String> _generateShadowBody() async {
    final shadowList = await _parseJson();
    final buffer = StringBuffer();

    buffer.writeln(_generateShadowMaps(shadowList));

    for (final shadow in shadowList) {
      buffer.writeln(
        '\nstatic const BoxShadow ${shadow.name!} = BoxShadow(${shadowParser(shadow)});',
      );
    }

    return buffer.toString();
  }

  String _generateShadowMaps(List<AppShadow> shadows) {
    final buffer = StringBuffer();

    buffer.writeln('\nstatic Map<String, BoxShadow> get allShadows => {');

    shadows.sort((a, b) => a.name?.compareTo(b.name ?? '') ?? shadows.length);

    for (final shadow in shadows) {
      buffer.writeln('"${shadow.description}": ${shadow.name},');
    }

    buffer.writeln("};");

    return buffer.toString();
  }

  String _getShadowName(String name) {
    return name.replaceAll(RegExp("[^A-Za-z0-9]"), "").replaceAll(" ", "");
  }
}
