import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


abstract class AppColors {
const AppColors({
  required this.alert20,required this.background,required this.black50,required this.black70,required this.black80,required this.black90,required this.error80,required this.orange,required this.orange30,required this.typo,
  required this.systemUiOverlayStyle,
});


 // error
final Color alert20;

 // dark
final Color background;
final Color black50;
final Color black70;
final Color black80;
final Color black90;
final Color error80;
final Color orange;
final Color orange30;
final Color typo;


  // System
final SystemUiOverlayStyle systemUiOverlayStyle;


Map<String, Map<String, Color>> get allColors => {
"error": errorColors,
"dark": darkColors,
"light": lightColors,
};

Map<String, Color> get errorColors => {
"alert20": alert20,
};

Map<String, Color> get darkColors => {
"background": background,
"black50": black50,
"black70": black70,
"black80": black80,
"black90": black90,
"error80": error80,
"orange": orange,
"orange30": orange30,
"typo": typo,
};

Map<String, Color> get lightColors => {
"background": background,
"black50": black50,
"black70": black70,
"black80": black80,
"black90": black90,
"error80": error80,
"orange": orange,
"orange30": orange30,
"typo": typo,
};

  }

class LightAppColors extends AppColors {
  const LightAppColors()
      : super(
        alert20: const Color(0xFFFCD9DB),background: const Color(0xFF27272E),black50: const Color(0xFF939396),black70: const Color(0xFF68686D),black80: const Color(0xFF525258),black90: const Color(0xFF3D3D43),error80: const Color(0xFF4F2C34),orange: const Color(0xFFFF6500),orange30: const Color(0xFFFFD1B3),typo: const Color(0xFFFFFFFF),
        systemUiOverlayStyle: SystemUiOverlayStyle.dark,
        );
}

class DarkAppColors extends AppColors {
  const DarkAppColors()
      : super(
          alert20: const Color(0xFFFCD9DB),background: const Color(0xFF27272E),black50: const Color(0xFF939396),black70: const Color(0xFF68686D),black80: const Color(0xFF525258),black90: const Color(0xFF3D3D43),error80: const Color(0xFF4F2C34),orange: const Color(0xFFFF6500),orange30: const Color(0xFFFFD1B3),typo: const Color(0xFFFFFFFF),
          systemUiOverlayStyle: SystemUiOverlayStyle.light,
        );

}
