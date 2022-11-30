import 'package:flutter/material.dart';

const _loremIpsum =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam id pellentesque neque. Cras in mauris a nisl mattis sagittis. Nullam tincidunt lorem dui, eget gravida felis mollis non. Proin ac quam at risus eleifend feugiat id in diam. Quisque gravida dui lorem, eget dapibus ligula ullamcorper eget. Donec vel nisi metus. Morbi tempus fringilla mi, ut consectetur nulla convallis et. Quisque eu blandit mauris, et mollis tortor. Sed hendrerit tincidunt massa vel imperdiet. Aliquam erat volutpat.';

class TypographyTile extends StatelessWidget {
  const TypographyTile({
    required this.name,
    required this.style,
    Key? key,
  }) : super(key: key);

  final String name;
  final TextStyle style;

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
        name,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      children: [
        Text(
          _loremIpsum,
          style: style,
        ),
      ],
    );
  }
}
