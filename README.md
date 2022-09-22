
# Figma Generator

## Generate style classes from figma

## Example

Styles in Figma

![Figma Colors Two](screenshots/colors-two.png)
![Figma Colors](screenshots/colors-one.png)
![Figma Typography](screenshots/typography.png)

Styles in dart class when will be exported

### Colors
```dart
abstract class AppColors {
  const AppColors({
    required this.alert20,
    required this.background,
    required this.black50,
    required this.black70,
    required this.black80,
    required this.black90,
    required this.error80,
    required this.orange,
    required this.orange30,
    required this.typo,
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
          alert20: const Color(0xFFFCD9DB),
          background: const Color(0xFF27272E),
          black50: const Color(0xFF939396),
          black70: const Color(0xFF68686D),
          black80: const Color(0xFF525258),
          black90: const Color(0xFF3D3D43),
          error80: const Color(0xFF4F2C34),
          orange: const Color(0xFFFF6500),
          orange30: const Color(0xFFFFD1B3),
          typo: const Color(0xFFFFFFFF),
          systemUiOverlayStyle: SystemUiOverlayStyle.dark,
        );
}

class DarkAppColors extends AppColors {
  const DarkAppColors()
      : super(
          alert20: const Color(0xFFFCD9DB),
          background: const Color(0xFF27272E),
          black50: const Color(0xFF939396),
          black70: const Color(0xFF68686D),
          black80: const Color(0xFF525258),
          black90: const Color(0xFF3D3D43),
          error80: const Color(0xFF4F2C34),
          orange: const Color(0xFFFF6500),
          orange30: const Color(0xFFFFD1B3),
          typo: const Color(0xFFFFFFFF),
          systemUiOverlayStyle: SystemUiOverlayStyle.light,
        );
}
```

### Typography

```dart
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

```

### Dimens

```dart
class AppDimens {
  const AppDimens._();

  static Map<String, double> get allDimens => {
        "zero": 0.0,
        "xxxsm": 2.0,
        "xxsm": 4.0,
        "xsm": 8.0,
        "sm": 12.0,
        "md": 16.0,
        "big": 20.0,
        "xbig": 24.0,
        "xxbig": 28.0,
        "xxxbig": 32.0,
        "lg": 40.0,
        "xlg": 48.0,
        "xxlg": 64.0,
        "xxxlg": 80.0,
        "huge": 96.0,
        "xhuge": 128.0,
        "xxhuge": 160.0,
        "xxxhuge": 192.0,
      };

  /// zero
  static const zero = 0.0;

  /// xxxsm
  static const xxxsm = 2.0;

  /// xxsm
  static const xxsm = 4.0;

  /// xsm
  static const xsm = 8.0;

  /// sm
  static const sm = 12.0;

  /// md
  static const md = 16.0;

  /// big
  static const big = 20.0;

  /// xbig
  static const xbig = 24.0;

  /// xxbig
  static const xxbig = 28.0;

  /// xxxbig
  static const xxxbig = 32.0;

  /// lg
  static const lg = 40.0;

  /// xlg
  static const xlg = 48.0;

  /// xxlg
  static const xxlg = 64.0;

  /// xxxlg
  static const xxxlg = 80.0;

  /// huge
  static const huge = 96.0;

  /// xhuge
  static const xhuge = 128.0;

  /// xxhuge
  static const xxhuge = 160.0;

  /// xxxhuge
  static const xxxhuge = 192.0;
}
```

## How to do it

### 1. Prepare colors and font styles accordingly

You must create colors and fonts styles, you can learn how to do it from articale below

🔗 &nbsp;&nbsp;[(Click Me!) How create colors and fonts styles](https://help.figma.com/hc/en-us/articles/360038746534-Create-color-text-effect-and-layout-grid-styles)

</br>

### 2. Install and configure plugin for figma

🔗 &nbsp;&nbsp;[(Click Me!) Design Tokens](https://www.figma.com/community/plugin/888356646278934516/Design-Tokens)

When you have aready installed plugin go to `Plugins > Design Tokens > Settings` and you must changed some parameters.

* in `Filename` section change format from `.tokens.json` to `.json`.
* in `Name conversion` set type to `camelCase`.

Okey, now you can save changes and go to next step!

</br>

### 3. Export to json

- go to `Plugins > Design Tokens > Export Design Token File`
- in `Include types in export` section, check only `Colors` and `Font Styles` option.
- click `Save & Export` and save file to `assets/styles` folder with name `styles.json`.

</br>

### 4. Generate the style classes

if you already have an exported styles file from figma, make sure it's in the folder `assets/styles` and use this command to generate the classes

```dart
  flutter pub run figma_generator:main
```

| Args | Name     | Description                |
| :-------- | :------- | :------------------------- |
| `-h` | `help` | Showing all parameters |
| `-S` | `source-dir` | Folder containing styles files (defaults is "assets/styles") |
| `-F` | `source-file` | File with color and font styles (defaults is "styles.json") |
| `-O` | `output-dir` | Output folder for the generated file (defaults is "lib/presentation/style") |
| `-t` | `output-file-typography` | Output file name (defaults is "app_typography.dart") |
| `-c` | `output-file-colors` |  Output file name (defaults is "app_colors.dart") |
| `-d` | `output-file-dimens` |  Output file name (defaults is "app_dimens.dart") |

</br>

### 5. There it is, you can already use your styles!

```dart
  Container(
    width: AppDimens.xxxhuge,
    color: AppColors.myCoolColor,
    child: Text(
      "YEAH!",
      style: AppTypography.myFontStyle
    ),
  ),
```