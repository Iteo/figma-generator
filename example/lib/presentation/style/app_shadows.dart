import 'package:flutter/material.dart';

class AppShadows {
  const AppShadows._();

  static Map<String, BoxShadow> get allShadows => {
        "cieZDoU": cieZDoU,
        "cieZGRy": cieZGRy,
        "divider1": divider1,
      };

  static const BoxShadow cieZDoU = BoxShadow(
    blurRadius: 16,
    spreadRadius: 0,
    color: Color(0x1A000000),
    offset: Offset(0, 8),
  );

  static const BoxShadow cieZGRy = BoxShadow(
    blurRadius: 16,
    spreadRadius: 0,
    color: Color(0x05000000),
    offset: Offset(0, -8),
  );

  static const BoxShadow divider1 = BoxShadow(
    blurRadius: 1,
    spreadRadius: 0,
    color: Color(0x0D000000),
    offset: Offset(0, 1),
  );
}
