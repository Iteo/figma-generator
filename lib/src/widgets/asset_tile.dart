import 'package:flutter/material.dart';
import 'package:flutter_figma_generator/src/models/asset_model.dart';
import 'package:flutter_figma_generator/src/utils/utils.dart';

class AssetTile extends StatelessWidget {
  const AssetTile({
    required this.asset,
    Key? key,
  }) : super(key: key);

  final AssetModel asset;

  @override
  Widget build(BuildContext context) {
    Widget subtitle(String text, Color color) => Container(
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
            subtitle(asset.type.name, Colors.orangeAccent),
            subtitle(asset.size, Colors.blueAccent),
            subtitle(asset.ext, Colors.redAccent),
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
