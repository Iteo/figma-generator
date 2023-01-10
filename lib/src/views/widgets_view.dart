import 'package:flutter/material.dart';
import 'package:flutter_figma_generator/src/widgets/widget_tile.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class WidgetsView extends HookWidget {
  const WidgetsView(this.widgets, {Key? key}) : super(key: key);

  final List<Widget>? widgets;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          ...widgets
                  ?.map((value) {
                    return WidgetTile(widget: value);
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
