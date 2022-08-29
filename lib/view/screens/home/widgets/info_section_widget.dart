import 'package:flutter/material.dart';
import 'package:rainery/config/colors.dart';

class MoreInfoSectionWidget extends StatelessWidget {
  const MoreInfoSectionWidget(
      {Key? key, required this.icon, required this.title})
      : super(key: key);
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: utilsColors.subColor,
          size: 20,
        ),
        const SizedBox(width: 5),
        Text(
          title,
          overflow: TextOverflow.clip,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
