import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorDialog extends StatelessWidget {
  const ColorDialog({
    required this.color,
    required this.name,
    required this.scaffoldKey,
    Key? key,
  }) : super(key: key);

  final Color color;
  final String name;
  final GlobalKey scaffoldKey;

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

          if (scaffoldKey.currentContext == null) return;

          ScaffoldMessenger.of(scaffoldKey.currentContext!).clearSnackBars();

          ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).primaryColor,
              padding: EdgeInsets.zero,
              content: MaterialBanner(
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () => ScaffoldMessenger.of(scaffoldKey.currentContext!).clearSnackBars(),
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
