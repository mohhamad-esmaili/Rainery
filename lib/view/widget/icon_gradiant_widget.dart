import 'package:flutter/material.dart';

class IconGradiantMask extends StatelessWidget {
  const IconGradiantMask({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: <Color>[
          Color(0xffFF5CA3),
          Color(0xffFFB67F),
        ],
        // colors: <Color>[
        //   Color(0xffDA5EFA),
        //   Color(0xff2CADFE),
        // ],

        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      ).createShader(bounds),
      child: child,
    );
  }
}
