import 'dart:convert';

import 'package:figma_generator/figma_generator.dart';
import 'package:figma_generator/src/views/widget_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

// Example
//
// Scaffold(
//   floatingActionButton: DesignSystemFloatingButton(
//      darkColors: DarkAppColors().allColors,
//      lightColors: LightAppColors().allColors,
//      typography: AppTypography.allStyles,
//      dimens: AppDimens.allDimens,
//      shadows: AppShadows.allShadows,
//      widgets: [CustomButton()],
//      assetsDir: 'assets',
//    ),
//   body: Center(
//     child: Text("Figma Generator"),
//   ),
// ),

const _iteo =
    '<svg width="81" height="24" fill="none" xmlns="http://www.w3.org/2000/svg"><g clip-path="url(#a)" fill-rule="evenodd" clip-rule="evenodd" fill="#FF6500"><path d="M43.84 17.553c.347.343.842.516 1.493.516h1.612v3.108H44.43c-1.437 0-2.574-.413-3.404-1.235-.834-.819-1.253-1.948-1.253-3.38v-6.205h-2.366V7.552h2.37V4.18H43.318v3.372h3.555v2.805h-3.555V16.093c0 .634.175 1.118.522 1.46Zm-9.889-10.02H30.42V4.18h3.531v3.352ZM30.42 21.177l-.006-12.222h3.543l.006 12.222H30.42Zm23.811-10.516c-.573.446-.967 1.078-1.18 1.887h6.661c-.255-.826-.678-1.462-1.26-1.9-.586-.441-1.294-.664-2.131-.664-.821 0-1.516.227-2.09.677Zm8.316-.26c.587 1.078.884 2.267.884 3.567a7.6 7.6 0 0 1-.076 1.078H52.95c.16.925.532 1.635 1.126 2.126.59.496 1.34.743 2.245.743.636 0 1.21-.14 1.72-.417a2.916 2.916 0 0 0 1.11-1.032h3.94c-.502 1.424-1.352 2.56-2.546 3.406-1.227.867-2.633 1.305-4.224 1.305-1.336 0-2.546-.314-3.639-.937a6.829 6.829 0 0 1-2.567-2.58c-.62-1.099-.93-2.309-.93-3.642 0-1.342.306-2.556.926-3.654a6.672 6.672 0 0 1 2.558-2.572c1.093-.62 2.308-.934 3.652-.934 1.373 0 2.608.323 3.701.962a6.657 6.657 0 0 1 2.525 2.581Zm13.49 6.296c-.687.69-1.566 1.033-2.634 1.033-1.072 0-1.95-.343-2.638-1.033-.686-.693-1.03-1.585-1.03-2.68 0-1.094.344-1.985 1.03-2.679.687-.69 1.567-1.036 2.638-1.036 1.068 0 1.947.346 2.634 1.036.687.694 1.03 1.585 1.03 2.68 0 1.094-.343 1.986-1.03 2.68Zm3.827-6.346a6.837 6.837 0 0 0-2.671-2.568c-1.135-.615-2.4-.925-3.79-.925-1.402 0-2.671.31-3.806.925a6.847 6.847 0 0 0-2.667 2.564c-.64 1.09-.963 2.312-.963 3.67 0 1.343.322 2.556.963 3.655a6.838 6.838 0 0 0 2.667 2.572c1.135.619 2.404.933 3.806.933 1.39 0 2.655-.314 3.79-.933a6.847 6.847 0 0 0 2.671-2.572c.65-1.099.972-2.313.972-3.654 0-1.35-.323-2.569-.972-3.667ZM3.727 11.291c-.092.46-.136.929-.136 1.409 0 4.135 3.428 7.499 7.637 7.499 4.214 0 7.641-3.376 7.641-7.523 0-1.4-.39-2.75-1.12-3.922a11.298 11.298 0 0 1-5.822 2.03c-.252.023-.483.023-.699.023-2.956 0-5.77-1.196-7.924-3.367L2.079 6.204l1.22-1.24c2.136-2.16 4.953-3.347 7.93-3.347.143 0 .287 0 .43.012a11.213 11.213 0 0 1 7.637 3.352c2.04 2.077 3.165 4.808 3.165 7.695 0 6.103-5.04 11.064-11.233 11.064C5.036 23.74 0 18.787 0 12.7c0-1.456.295-2.904.858-4.237l2.869 2.829Zm3.705-5.088a7.199 7.199 0 0 0 4.183 1.053l.074-.006a7.669 7.669 0 0 0 3.446-1.04A7.662 7.662 0 0 0 11.5 5.165l-.086-.005c-.062-.005-.124-.003-.187-.003-1.365 0-2.65.358-3.795 1.047ZM21.718.394l-2.404 2.37 2.497 2.462 2.405-2.37L21.718.394Z"/></g><defs><clipPath id="a"><path fill="#fff" d="M0 0h81v24H0z"/></clipPath></defs></svg>';

const _loremIpsum =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id pellentesque neque. Cras in mauris a nisl mattis sagittis. Nullam tincidunt lorem dui, eget gravida felis mollis non. Proin ac quam at risus eleifend feugiat id in diam. Quisque gravida dui lorem, eget dapibus ligula ullamcorper eget. Donec vel nisi metus. Morbi tempus fringilla mi, ut consectetur nulla convallis et. Quisque eu blandit mauris, et mollis tortor. Sed hendrerit tincidunt massa vel imperdiet. Aliquam erat volutpat.';

const _pagesName = [
  "Colors",
  "Typography",
  "Shadows",
  "Dimens",
  "Assets",
  "Widgets",
];

const _pagesIcon = [
  Icons.color_lens,
  Icons.format_size,
  Icons.contrast,
  Icons.space_dashboard,
  Icons.folder,
  Icons.category_rounded
];

final _scaffoldKey = GlobalKey();

class DesignSystemFloatingButton extends StatelessWidget {
  const DesignSystemFloatingButton({
    this.typography,
    this.dimens,
    this.lightColors,
    this.darkColors,
    this.shadows,
    this.widgets,
    this.assetsDir,
    Key? key,
  }) : super(key: key);

  final Map<String, TextStyle>? typography;
  final Map<String, double>? dimens;
  final Map<String, Map<String, Color>>? lightColors;
  final Map<String, Map<String, Color>>? darkColors;
  final Map<String, BoxShadow>? shadows;
  final List<Widget>? widgets;
  final String? assetsDir;

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
            shadows: shadows,
            widgets: widgets,
            assetsDir: assetsDir,
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
    this.shadows,
    this.widgets,
    this.assetsDir,
    Key? key,
  }) : super(key: key);

  final Map<String, TextStyle>? typography;
  final Map<String, double>? dimens;
  final Map<String, Map<String, Color>>? lightColors;
  final Map<String, Map<String, Color>>? darkColors;
  final Map<String, BoxShadow>? shadows;
  final List<Widget>? widgets;
  final String? assetsDir;

  @override
  Widget build(BuildContext context) {
    final currentPage = useState<int>(0);
    final darkMode = useState<bool>(MediaQuery.of(context).platformBrightness == Brightness.dark);

    return MaterialApp(
      theme: darkMode.value
          ? ThemeData.dark().copyWith(
              primaryColor: Colors.orange,
              appBarTheme: AppBarTheme(
                color: ThemeData.dark().scaffoldBackgroundColor,
                foregroundColor: Colors.white,
              ),
            )
          : ThemeData.light().copyWith(
              primaryColor: Colors.orange,
              appBarTheme: AppBarTheme(
                color: ThemeData.light().scaffoldBackgroundColor,
                foregroundColor: Colors.black,
              ),
            ),
      home: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: Column(
            children: [
              const _DrawerHeader(),
              ..._pagesName.map(
                (e) {
                  var index = _pagesName.indexOf(e);
                  return _DrawerItem(
                    icon: _pagesIcon[index],
                    title: e,
                    isActive: currentPage.value == index,
                    onTap: () => currentPage.value = index,
                  );
                },
              ).toList(),
            ],
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              systemOverlayStyle: darkMode.value ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
              title: Text(_pagesName[currentPage.value]),
              floating: true,
              pinned: true,
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
            ),
            [
              _Colors(darkMode.value ? darkColors : lightColors),
              _Typography(typography),
              _Shadows(shadows),
              _Dimens(dimens),
              _Assets(assetsDir),
              _Widgets(widgets),
            ][currentPage.value],
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              ),
            ),
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
        child: SvgPicture.string(
          _iteo,
          color: Colors.white,
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
  const _Assets(this.assetsDir, {Key? key}) : super(key: key);

  final String? assetsDir;

  @override
  Widget build(BuildContext context) {
    final assets = useState<List<AssetModel>>([]);

    useEffect(() {
      SchedulerBinding.instance.addPostFrameCallback((_) async {
        assets.value = await UtilsApp.getAssets(context, assetsDir: assetsDir);
      });
    }, []);

    return SliverVisibility(
      visible: assets.value.isNotEmpty,
      replacementSliver: SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            ...assets.value.map((value) {
              return _AssetTile(asset: value);
            }).toList()
          ],
        ),
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
    Widget _subtitle(String text, Color color) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: color.withOpacity(0.12),
          ),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: color,
                ),
          ),
        );

    return ExpansionTile(
      collapsedIconColor: Theme.of(context).primaryColor,
      iconColor: Theme.of(context).primaryColor,
      childrenPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      title: Text(
        asset.name.replaceAll("%20", " "),
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Wrap(
          runSpacing: 8,
          spacing: 8,
          children: [
            _subtitle(asset.type.name, Colors.orangeAccent),
            _subtitle(asset.size, Colors.blueAccent),
            _subtitle(asset.ext, Colors.redAccent),
          ],
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder<Widget>(
            future: UtilsApp.getAssetWidget(asset, context),
            builder: (context, value) => value.hasData
                ? value.data!
                : Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
          ),
        ),
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

    return SliverList(
      delegate: SliverChildListDelegate(
        [
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
      ),
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
            ? GridView.builder(
                padding: const EdgeInsets.only(bottom: 24),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                shrinkWrap: true,
                itemCount: colors.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => _ColorTile(
                  color: colors.values.elementAt(index),
                  name: colors.keys.elementAt(index),
                  gridView: gridView,
                ),
              )
            : ListView.separated(
                itemCount: colors.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 24),
                separatorBuilder: (context, _) => const Divider(),
                itemBuilder: (context, index) => _ColorTile(
                  color: colors.values.elementAt(index),
                  name: colors.keys.elementAt(index),
                  gridView: gridView,
                ),
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
          builder: (_) => _ColorDialog(color: color, name: name),
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

class _Shadows extends HookWidget {
  const _Shadows(this.shadows, {Key? key}) : super(key: key);

  final Map<String, BoxShadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          ...shadows
                  ?.map((key, value) {
                    return MapEntry(
                      key,
                      _ShadowTile(
                        name: key,
                        shadow: value,
                      ),
                    );
                  })
                  .values
                  .toList() ??
              [],
        ],
      ),
    );
  }
}

class _Dimens extends HookWidget {
  const _Dimens(this.dimens, {Key? key}) : super(key: key);

  final Map<String, double>? dimens;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
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
      ),
    );
  }
}

class _Typography extends HookWidget {
  const _Typography(this.typography, {Key? key}) : super(key: key);

  final Map<String, TextStyle>? typography;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
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
      ),
    );
  }
}

class _ShadowTile extends StatelessWidget {
  const _ShadowTile({
    required this.name,
    required this.shadow,
    Key? key,
  }) : super(key: key);

  final String name;
  final BoxShadow shadow;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Theme.of(context).primaryColor,
      iconColor: Theme.of(context).primaryColor,
      childrenPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 24,
      ),
      title: Text(
        name,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.50,
          height: MediaQuery.of(context).size.width * 0.30,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: [
              shadow,
            ],
          ),
        ),
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
      child: GestureDetector(
        onTap: () {
          Clipboard.setData(
            ClipboardData(
              text: color.toString().replaceAll("Color(0x", "#").replaceAll(")", "").toUpperCase(),
            ),
          );

          if (_scaffoldKey.currentContext == null) return;

          ScaffoldMessenger.of(_scaffoldKey.currentContext!).clearSnackBars();

          ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).primaryColor,
              padding: EdgeInsets.zero,
              content: MaterialBanner(
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () => ScaffoldMessenger.of(_scaffoldKey.currentContext!).clearSnackBars(),
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ],
                content: Text(
                  "Color $name hex was coppied!",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: Colors.white,
                      ),
                ),
                backgroundColor: Theme.of(context).primaryColor,
              ),
            ),
          );
        },
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
              Text(
                color.toString().replaceAll("Color(0x", "#").replaceAll(")", "").toUpperCase(),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _Widgets extends HookWidget {
  const _Widgets(this.widgets, {Key? key}) : super(key: key);

  final List<Widget>? widgets;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          ...widgets
                  ?.map((value) {
                    return _WidgetTile(widget: value);
                  })
                  .toList()
                  .expand(
                    (element) => [
                      element,
                      const Divider(height: 0),
                    ],
                  ) ??
              [],
        ],
      ),
    );
  }
}

class _WidgetTile extends StatelessWidget {
  const _WidgetTile({
    required this.widget,
    Key? key,
  }) : super(key: key);

  final Widget widget;

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
        widget.runtimeType.toString(),
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WidgetPreview(widget),
              ),
            );
          },
          child: AbsorbPointer(
            absorbing: true,
            child: Flexible(
              child: widget,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
