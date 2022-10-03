import 'package:figma_generator/figma_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Example
//
// Scaffold(
//   floatingActionButton: DesignSystemFloatingButton(
//     darkColors: const DarkAppColors().allColors,
//     lightColors: const LightAppColors().allColors,
//     typography: AppTypography.allStyles,
//   ),
//   body: Center(
//     child: Text("Theme Tailor"),
//   ),
// ),

const _loremIpsum =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id pellentesque neque. Cras in mauris a nisl mattis sagittis. Nullam tincidunt lorem dui, eget gravida felis mollis non. Proin ac quam at risus eleifend feugiat id in diam. Quisque gravida dui lorem, eget dapibus ligula ullamcorper eget. Donec vel nisi metus. Morbi tempus fringilla mi, ut consectetur nulla convallis et. Quisque eu blandit mauris, et mollis tortor. Sed hendrerit tincidunt massa vel imperdiet. Aliquam erat volutpat.';

const _pagesName = [
  "Colors",
  "Font styles",
  "Dimenss",
  "Assets",
];

class DesignSystemFloatingButton extends StatelessWidget {
  const DesignSystemFloatingButton({
    this.typography,
    this.dimens,
    this.lightColors,
    this.darkColors,
    Key? key,
  }) : super(key: key);

  final Map<String, TextStyle>? typography;
  final Map<String, double>? dimens;
  final Map<String, Map<String, Color>>? lightColors;
  final Map<String, Map<String, Color>>? darkColors;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => _DesignSystemPage(
            darkColors: darkColors,
            lightColors: lightColors,
            typography: typography,
            dimens: dimens,
          ),
        ),
      ),
      child: const Icon(Icons.palette_rounded),
    );
  }
}

class _DesignSystemPage extends HookWidget {
  const _DesignSystemPage({
    this.typography,
    this.lightColors,
    this.darkColors,
    this.dimens,
    Key? key,
  }) : super(key: key);

  final Map<String, TextStyle>? typography;
  final Map<String, double>? dimens;
  final Map<String, Map<String, Color>>? lightColors;
  final Map<String, Map<String, Color>>? darkColors;

  @override
  Widget build(BuildContext context) {
    final currentPage = useState<int>(0);
    final pageController = usePageController(initialPage: currentPage.value);
    final darkMode = useState<bool>(MediaQuery.of(context).platformBrightness == Brightness.dark);

    useEffect(() {
      pageController.addListener(() {
        currentPage.value = pageController.page?.toInt() ?? 0;
      });
    });

    return MaterialApp(
      theme: darkMode.value
          ? ThemeData.dark().copyWith(primaryColor: Colors.orange)
          : ThemeData.light().copyWith(primaryColor: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: darkMode.value ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(_pagesName[currentPage.value]),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                darkMode.value ? Icons.sunny : Icons.dark_mode_rounded,
              ),
              onPressed: () {
                darkMode.value = !darkMode.value;
              },
            ),
          ],
          foregroundColor: darkMode.value ? Colors.white : Colors.black,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              const _DrawerHeader(),
              _DrawerItem(
                icon: Icons.color_lens,
                title: "Colors",
                isActive: currentPage.value == 0,
                onTap: () => pageController.jumpToPage(0),
              ),
              _DrawerItem(
                icon: Icons.format_size,
                title: "Font styles",
                isActive: currentPage.value == 1,
                onTap: () => pageController.jumpToPage(1),
              ),
              _DrawerItem(
                icon: Icons.space_dashboard,
                title: "Dimens",
                isActive: currentPage.value == 2,
                onTap: () => pageController.jumpToPage(2),
              ),
              _DrawerItem(
                icon: Icons.folder,
                title: "Assets",
                isActive: currentPage.value == 3,
                onTap: () => pageController.jumpToPage(3),
              ),
            ],
          ),
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            _Colors(darkMode.value ? darkColors : lightColors),
            _Typography(typography),
            _Dimens(dimens),
            const _Assets(),
          ],
        ),
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      padding: EdgeInsets.zero,
      child: Center(
        child: Text(
          "Design System",
          style: Theme.of(context).textTheme.headline5?.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  const _DrawerItem({
    required this.title,
    required this.icon,
    required this.isActive,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: isActive ? Theme.of(context).primaryColor : null,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              color: isActive ? Theme.of(context).primaryColor : null,
              fontWeight: isActive ? FontWeight.bold : null,
            ),
      ),
    );
  }
}

class _Assets extends HookWidget {
  const _Assets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final assets = useState<List<AssetModel>>([]);

    useEffect(() {});

    return Visibility(
      visible: assets.value.isNotEmpty,
      replacement: Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: ListView(
        children: [
          ...assets.value.map((value) {
            return _AssetTile(asset: value);
          }).toList()
        ],
      ),
    );
  }
}

class _AssetTile extends StatelessWidget {
  const _AssetTile({
    required this.asset,
    Key? key,
  }) : super(key: key);

  final AssetModel asset;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Theme.of(context).primaryColor,
      iconColor: Theme.of(context).primaryColor,
      childrenPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      title: Text(
        asset.name,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      children: const [
        Text(_loremIpsum),
      ],
    );
  }
}

class _Colors extends HookWidget {
  const _Colors(this.colors, {Key? key}) : super(key: key);

  final Map<String, Map<String, Color>>? colors;

  @override
  Widget build(BuildContext context) {
    final gridView = useState<bool>(false);

    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            top: 16,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "You can tap on color to see its details.",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              IconButton(
                onPressed: () => gridView.value = !gridView.value,
                icon: Icon(
                  !gridView.value ? Icons.grid_view_rounded : Icons.view_list_rounded,
                ),
              )
            ],
          ),
        ),
        ...colors
                ?.map((key, value) {
                  return MapEntry(
                    key,
                    _ColorsComponent(
                      title: key,
                      colors: value,
                      gridView: gridView.value,
                    ),
                  );
                })
                .values
                .toList() ??
            [],
      ],
    );
  }
}

class _ColorsComponent extends StatelessWidget {
  const _ColorsComponent({
    required this.title,
    required this.colors,
    required this.gridView,
    Key? key,
  }) : super(key: key);

  final String title;
  final bool gridView;
  final Map<String, Color> colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        gridView
            ? GridView.extent(
                maxCrossAxisExtent: 194,
                childAspectRatio: 1,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: colors
                    .map((key, value) {
                      return MapEntry(
                        key,
                        _ColorTile(
                          color: value,
                          name: key,
                          gridView: gridView,
                        ),
                      );
                    })
                    .values
                    .toList(),
              )
            : Column(
                children: colors
                    .map((key, value) {
                      return MapEntry(
                        key,
                        _ColorTile(
                          color: value,
                          name: key,
                          gridView: gridView,
                        ),
                      );
                    })
                    .values
                    .expand((element) => [element, const Divider()])
                    .toList(),
              ),
      ],
    );
  }
}

class _ColorTile extends StatelessWidget {
  const _ColorTile({
    required this.name,
    required this.color,
    required this.gridView,
    Key? key,
  }) : super(key: key);

  final String name;
  final Color color;
  final bool gridView;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => _ColorDialog(
            color: color,
            name: name,
          ),
        );
      },
      padding: EdgeInsets.zero,
      minSize: 0,
      child: gridView
          ? GridTile(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 38,
                      child: Text(
                        name,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: color,
                  radius: 20,
                ),
              ),
              title: Text(name),
              subtitle: Text(
                color.toString().replaceAll("Color(0x", "#").replaceAll(")", "").toUpperCase(),
              ),
            ),
    );
  }
}

class _Dimens extends HookWidget {
  const _Dimens(this.dimens, {Key? key}) : super(key: key);

  final Map<String, double>? dimens;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...dimens
                ?.map((key, value) {
                  return MapEntry(
                    key,
                    _DimensTile(
                      name: key,
                      dimen: value,
                    ),
                  );
                })
                .values
                .toList() ??
            [],
      ],
    );
  }
}

class _Typography extends HookWidget {
  const _Typography(this.typography, {Key? key}) : super(key: key);

  final Map<String, TextStyle>? typography;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...typography
                ?.map((key, value) {
                  return MapEntry(
                    key,
                    _TypographyTile(
                      name: key,
                      style: value,
                    ),
                  );
                })
                .values
                .toList() ??
            [],
      ],
    );
  }
}

class _DimensTile extends StatelessWidget {
  const _DimensTile({
    required this.name,
    required this.dimen,
    Key? key,
  }) : super(key: key);

  final String name;
  final double dimen;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Theme.of(context).primaryColor,
      iconColor: Theme.of(context).primaryColor,
      childrenPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      title: Text(
        "$name ($dimen)",
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      children: [
        SizedBox(
          height: dimen,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: dimen,
                height: dimen,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(width: dimen * 0.1),
              Column(
                children: [
                  Container(
                    height: dimen * 0.01,
                    width: dimen * 0.1,
                    color: Theme.of(context).primaryColor,
                  ),
                  Container(
                    height: dimen * 0.98,
                    width: dimen * 0.01,
                    color: Theme.of(context).primaryColor,
                  ),
                  Container(
                    height: dimen * 0.01,
                    width: dimen * 0.1,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(" $dimen"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TypographyTile extends StatelessWidget {
  const _TypographyTile({
    required this.name,
    required this.style,
    Key? key,
  }) : super(key: key);

  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Theme.of(context).primaryColor,
      iconColor: Theme.of(context).primaryColor,
      childrenPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      title: Text(
        name,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      children: [
        Text(
          _loremIpsum,
          style: style,
        ),
      ],
    );
  }
}

class _ColorDialog extends StatelessWidget {
  const _ColorDialog({
    required this.color,
    required this.name,
    Key? key,
  }) : super(key: key);

  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(name),
            const SizedBox(height: 8),
            Text(
              "Opacity: ${color.opacity.toStringAsFixed(2).toUpperCase()}",
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                Clipboard.setData(
                  ClipboardData(
                    text: color.toString().replaceAll("Color(0x", "#").replaceAll(")", "").toUpperCase(),
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Color hex was coppied to clipboard!"),
                  ),
                );
              },
              child: Text(
                color.toString().replaceAll("Color(0x", "#").replaceAll(")", "").toUpperCase(),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
