import 'package:figma_generator/src/views/widget_preview.dart';
import 'package:flutter/material.dart';

class WidgetTile extends StatelessWidget {
  const WidgetTile({
    required this.widget,
    Key? key,
  }) : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Theme.of(context).primaryColor,
      iconColor: Theme.of(context).primaryColor,
      childrenPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      title: Text(
        widget.runtimeType.toString(),
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WidgetPreview(widget),
              ),
            );
          },
          child: AbsorbPointer(
            absorbing: true,
            child: Flexible(
              child: widget,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
