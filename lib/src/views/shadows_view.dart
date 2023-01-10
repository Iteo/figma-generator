import 'package:flutter/material.dart';
import 'package:flutter_figma_generator/src/widgets/shadow_tile.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ShadowsView extends HookWidget {
  const ShadowsView(this.shadows, {Key? key}) : super(key: key);

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
                      ShadowTile(
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
