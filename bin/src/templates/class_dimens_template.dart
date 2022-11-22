import '../models/app_dimen.dart';

class ClassAppDimensTemplate {
  ClassAppDimensTemplate({
    required this.className,
    required this.data,
  });

  final String className;
  final List<AppDimen> data;

  String generate() {
    return '''
class $className {
const $className._();

${_generateAppDimensMaps()}

${_generateAppDimens()}
''';
  }

  String _generateAppDimens() {
    final buffer = StringBuffer();

    for (final dimen in data) {
      buffer.writeln('\n /// ${dimen.name}');

      buffer.writeln('static const ${dimen.name} = ${dimen.value};');
    }

    return buffer.toString();
  }

  String _generateAppDimensMaps() {
    final buffer = StringBuffer();

    buffer.writeln('\nstatic Map<String, double> get allDimens => {');

    for (final dimen in data) {
      buffer.writeln('"${dimen.name}": ${dimen.value},');
    }

    buffer.writeln("};");

    return buffer.toString();
  }
}
