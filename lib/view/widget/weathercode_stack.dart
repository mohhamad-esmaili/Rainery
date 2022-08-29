import 'package:flutter/material.dart';
import 'package:rainery/view/widget/icon_shadermask.dart';

class WeathercodeStackWidget extends StatelessWidget {
  const WeathercodeStackWidget({Key? key, required this.iconData})
      : super(key: key);
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconShaderMaskWidget(
          child: Icon(
            iconData,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
