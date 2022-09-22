import '../models/app_dimen.dart';

var _dimens = <AppDimen>[
  AppDimen(value: 0.0, name: "zero"),
  AppDimen(value: 2.0, name: "xxxsm"),
  AppDimen(value: 4.0, name: "xxsm"),
  AppDimen(value: 8.0, name: "xsm"),
  AppDimen(value: 12.0, name: "sm"),
  AppDimen(value: 16.0, name: "md"),
  AppDimen(value: 20.0, name: "big"),
  AppDimen(value: 24.0, name: "xbig"),
  AppDimen(value: 28.0, name: "xxbig"),
  AppDimen(value: 32.0, name: "xxxbig"),
  AppDimen(value: 40.0, name: "lg"),
  AppDimen(value: 48.0, name: "xlg"),
  AppDimen(value: 64.0, name: "xxlg"),
  AppDimen(value: 80.0, name: "xxxlg"),
  AppDimen(value: 96.0, name: "huge"),
  AppDimen(value: 128.0, name: "xhuge"),
  AppDimen(value: 160.0, name: "xxhuge"),
  AppDimen(value: 192.0, name: "xxxhuge"),
];

class ClassAppDimensTemplate {
  String generate(String className) {
    return '''
${_classGenerate(className)}
''';
  }

  String _classGenerate(String className) {
    return '''
class $className {
const $className._();

${_generateAppDimensMaps()}

${_generateAppDimens()}
''';
  }

  String _generateAppDimens() {
    final buffer = StringBuffer();

    for (final dimen in _dimens) {
      buffer.writeln('\n /// ${dimen.name}');

      buffer.writeln('static const ${dimen.name} = ${dimen.value};');
    }

    return buffer.toString();
  }

  String _generateAppDimensMaps() {
    final buffer = StringBuffer();

    buffer.writeln('\nstatic Map<String, double> get allDimens => {');

    for (final dimen in _dimens) {
      buffer.writeln('"${dimen.name}": ${dimen.value},');
    }

    buffer.writeln("};");

    return buffer.toString();
  }
}
