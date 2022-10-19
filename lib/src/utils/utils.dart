import 'dart:math';

import 'package:figma_generator/figma_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/svg.dart';

class UtilsApp {
  static Future<String> getFileSize(String filepath, int decimals) async {
    try {
      int bytes = (await rootBundle.load(filepath)).lengthInBytes;
      if (bytes <= 0) return "0 B";
      const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
      var i = (log(bytes) / log(1024)).floor();
      return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
    } catch (_) {
      return '-';
    }
  }

  static AssetModelType getAssetType(String ext) {
    if (ext == 'json') return AssetModelType.json;

    if (ext == 'svg') return AssetModelType.svg;

    if (ext == 'jpg' || ext == 'png' || ext == 'gif') return AssetModelType.image;

    if (ext == 'mp3' || ext == 'wav' || ext == 'aac') return AssetModelType.audio;

    return AssetModelType.other;
  }

  static Future<Widget> getAssetWidget(AssetModel asset, BuildContext context) async {
    switch (asset.type) {
      case AssetModelType.image:
        return Image.asset(asset.path);
      case AssetModelType.svg:
        return SvgPicture.asset(asset.path);
      case AssetModelType.audio:
        return const Text('Unable to preview file');
      case AssetModelType.json:
        String data = await DefaultAssetBundle.of(context).loadString(asset.path);
        return Text(data);
      case AssetModelType.other:
        return const Text('Unable to preview file');
    }
  }
}
