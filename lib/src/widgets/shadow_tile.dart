import 'package:flutter/material.dart';

class ShadowTile extends StatelessWidget {
  const ShadowTile({
    required this.name,
    required this.shadow,
    Key? key,
  }) : super(key: key);

  final String name;
  final BoxShadow shadow;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: Theme.of(context).primaryColor,
      iconColor: Theme.of(context).primaryColor,
      childrenPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 24,
      ),
      title: Text(
        name,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.50,
          height: MediaQuery.of(context).size.width * 0.30,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: [
              shadow,
            ],
          ),
        ),
      ],
    );
  }
}
