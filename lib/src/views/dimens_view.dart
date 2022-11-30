import 'package:figma_generator/src/widgets/dimens_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DimensView extends HookWidget {
  const DimensView(this.dimens, {Key? key}) : super(key: key);

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
                      DimensTile(
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
