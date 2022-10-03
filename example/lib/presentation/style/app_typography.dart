import 'package:flutter/material.dart';

class AppTypography {
  const AppTypography._();

  static Map<String, TextStyle> get allStyles => {
        "b1": b1,
        "b2": b2,
        "b3": b3,
        "b4": b4,
        "b5": b5,
        "h1": h1,
        "h2": h2,
        "h3": h3,
        "h4": h4,
        "h5": h5,
        "h6": h6,
        "info": info,
        "info 2": info2,
        "info 3": info3,
      };

  static const TextStyle b1 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18,
    height: 1.7777777777777777,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    debugLabel: "b1",
  );

  static const TextStyle b2 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    height: 2.0,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    debugLabel: "b2",
  );

  static const TextStyle b3 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    height: 1.7142857142857142,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    debugLabel: "b3",
  );

  static const TextStyle b4 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    height: 1.5,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
    debugLabel: "b4",
  );

  static const TextStyle b5 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    height: 1.7142857142857142,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    debugLabel: "b5",
  );

  static const TextStyle h1 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 44,
    height: 1.2727272727272727,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    debugLabel: "h1",
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 36,
    height: 1.5555555555555556,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    debugLabel: "h2",
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24,
    height: 1.3333333333333333,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    debugLabel: "h3",
  );

  static const TextStyle h4 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24,
    height: 1.3333333333333333,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    debugLabel: "h4",
  );

  static const TextStyle h5 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20,
    height: 1.6,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    debugLabel: "h5",
  );

  static const TextStyle h6 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20,
    height: 1.6,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    debugLabel: "h6",
  );

  static const TextStyle info = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12,
    height: 1.3333333333333333,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    debugLabel: "info",
  );

  static const TextStyle info2 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12,
    height: 1.3333333333333333,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    debugLabel: "info2",
  );

  static const TextStyle info3 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12,
    height: 1.3333333333333333,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    debugLabel: "info3",
  );
}
