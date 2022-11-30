import 'package:figma_generator/src/models/asset_model.dart';
import 'package:figma_generator/src/utils/utils.dart';
import 'package:figma_generator/src/widgets/asset_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AssetsView extends HookWidget {
  const AssetsView(this.assetsDir, {Key? key}) : super(key: key);

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
              return AssetTile(asset: value);
            }).toList()
          ],
        ),
      ),
    );
  }
}
