import 'package:figma_generator/src/widgets/color_tile.dart';
import 'package:flutter/material.dart';

class ColorsComponent extends StatelessWidget {
  const ColorsComponent({
    required this.title,
    required this.colors,
    required this.gridView,
    required this.scaffoldKey,
    Key? key,
  }) : super(key: key);

  final String title;
  final bool gridView;
  final Map<String, Color> colors;
  final GlobalKey scaffoldKey;

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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                shrinkWrap: true,
                itemCount: colors.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ColorTile(
                  color: colors.values.elementAt(index),
                  name: colors.keys.elementAt(index),
                  gridView: gridView,
                  scaffoldKey: scaffoldKey,
                ),
              )
            : ListView.separated(
                itemCount: colors.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 24),
                separatorBuilder: (context, _) => const Divider(),
                itemBuilder: (context, index) => ColorTile(
                  color: colors.values.elementAt(index),
                  name: colors.keys.elementAt(index),
                  gridView: gridView,
                  scaffoldKey: scaffoldKey,
                ),
              ),
      ],
    );
  }
}
