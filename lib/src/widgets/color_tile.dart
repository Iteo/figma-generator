import 'package:figma_generator/src/widgets/color_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorTile extends StatelessWidget {
  const ColorTile({
    required this.name,
    required this.color,
    required this.gridView,
    required this.scaffoldKey,
    Key? key,
  }) : super(key: key);

  final String name;
  final Color color;
  final bool gridView;
  final GlobalKey scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => ColorDialog(
            color: color,
            name: name,
            scaffoldKey: scaffoldKey,
          ),
        );
      },
      padding: EdgeInsets.zero,
      minSize: 0,
      child: gridView
          ? GridTile(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 38,
                      child: Text(
                        name,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: color,
                  radius: 20,
                ),
              ),
              title: Text(name),
              subtitle: Text(
                color.toString().replaceAll("Color(0x", "#").replaceAll(")", "").toUpperCase(),
              ),
            ),
    );
  }
}
