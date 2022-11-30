// ignore_for_file: avoid_print

import '../models/app_shadow.dart';
import '../models/app_typography.dart';

final _beforeNonLeadingCapitalLetter = RegExp(r"(?=(?!^)[A-Z])");

String toColor(String str) {
  return 'Color(0x${str.substring(0, 7).replaceFirst("#", str.substring(7, 9)).toUpperCase()})';
}

String shadowParser(AppShadow shadow) {
  final buffer = StringBuffer();

  buffer.writeln("blurRadius: ${shadow.radius},");
  buffer.writeln("spreadRadius: ${shadow.spread},");
  buffer.writeln("color: ${toColor(shadow.color!)},");
  buffer.writeln("offset:  Offset(${shadow.offsetX}, ${shadow.offsetY}),");

  return buffer.toString();
}

String typographyParser(AppTypography typography) {
  final buffer = StringBuffer();

  if (typography.fontFamily != 'none') {
    buffer.writeln("fontFamily: '${typography.fontFamily}',");
  }

  if (typography.fontSize != null) {
    buffer.writeln('fontSize: ${typography.fontSize},');
  }

  if (typography.height != null) {
    buffer.writeln(
      'height: ${computeFontSize(typography.fontSize, typography.height)},',
    );
  }

  if (typography.fontStyle != 'none') {
    buffer.writeln('fontStyle: FontStyle.${typography.fontStyle},');
  }

  if (typography.letterSpacing != null) {
    buffer.writeln('letterSpacing: ${typography.letterSpacing},');
  }

  if (typography.fontWeight != null) {
    buffer.writeln('fontWeight: FontWeight.w${typography.fontWeight},');
  }

  if (typography.decoration != null) {
    var decoration = "TextDecoration.none";

    switch (typography.decoration) {
      case "underline":
        decoration = "TextDecoration.underline";
        break;
      case "overline":
        decoration = "TextDecoration.overline";
        break;
      case "line-through":
        decoration = "TextDecoration.lineThrough";
        break;
      default:
        decoration = "TextDecoration.none";
    }

    buffer.writeln('decoration: $decoration,');
  }

  buffer.writeln('debugLabel: "${typography.name}",');

  return buffer.toString();
}

double computeFontSize(int? fontSize, int? lineHeight) {
  return ((lineHeight ?? 1) / (fontSize ?? 1));
}

String getFileNameFromClassName(String input) =>
    '${input.split(_beforeNonLeadingCapitalLetter).join('_')}.dart'
        .toLowerCase();

void printInfo(String info) {
  print('\u001b[32mFG: $info\u001b[0m');
}

void printError(String error) {
  print('\u001b[31m[ERROR] FG: $error\u001b[0m');
}
