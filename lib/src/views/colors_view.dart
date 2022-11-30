import 'package:figma_generator/src/widgets/color_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ColorsView extends HookWidget {
  const ColorsView(this.colors, this.scaffoldKey, {Key? key}) : super(key: key);

  final Map<String, Map<String, Color>>? colors;
  final GlobalKey scaffoldKey;

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
                    !gridView.value
                        ? Icons.grid_view_rounded
                        : Icons.view_list_rounded,
                  ),
                )
              ],
            ),
          ),
          ...colors
                  ?.map((key, value) {
                    return MapEntry(
                      key,
                      ColorsComponent(
                        title: key,
                        colors: value,
                        gridView: gridView.value,
                        scaffoldKey: scaffoldKey,
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
