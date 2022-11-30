import 'package:flutter/material.dart';

class DimensTile extends StatelessWidget {
  const DimensTile({
    required this.name,
    required this.dimen,
    Key? key,
  }) : super(key: key);

  final String name;
  final double dimen;

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
        "$name ($dimen)",
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      children: [
        SizedBox(
          height: dimen,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: dimen,
                height: dimen,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(width: dimen * 0.1),
              Column(
                children: [
                  Container(
                    height: dimen * 0.01,
                    width: dimen * 0.1,
                    color: Theme.of(context).primaryColor,
                  ),
                  Container(
                    height: dimen * 0.98,
                    width: dimen * 0.01,
                    color: Theme.of(context).primaryColor,
                  ),
                  Container(
                    height: dimen * 0.01,
                    width: dimen * 0.1,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(" $dimen"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
