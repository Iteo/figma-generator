import 'package:example/presentation/style/app_colors.dart';
import 'package:example/presentation/style/app_dimens.dart';
import 'package:example/presentation/style/app_shadows.dart';
import 'package:example/presentation/style/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_figma_generator/flutter_figma_generator.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: DesignSystemFloatingButton(
          darkColors: DarkAppColors().allColors,
          lightColors: LightAppColors().allColors,
          typography: AppTypography.allStyles,
          dimens: AppDimens.allDimens,
          shadows: AppShadows.allShadows,
          widgets: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.yellow,
                  ),
                ),
                Flexible(
                  child: Container(
                    width: 300,
                    height: 150,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Click Me!"),
            ),
          ],
          assetsDir: 'assets',
        ),
      ),
    );
  }
}
