import 'package:flutter/material.dart';
import 'package:flutter_figma_generator/src/widgets/typography_tile.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TypographyView extends HookWidget {
  const TypographyView(this.typography, {Key? key}) : super(key: key);

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
                      TypographyTile(
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
