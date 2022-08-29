import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainery/view-model/theme_provider.dart';

class IconShaderMaskWidget extends StatelessWidget {
  const IconShaderMaskWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    bool isDark = Provider.of<ThemeProvider>(context, listen: true).isDark;
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: isDark
            ? <Color>[
                const Color(0xffD75EF9),
                const Color(0xff2AAFFF),
              ]
            : <Color>[
                const Color(0xffFF5CA3),
                const Color(0xffFFB67F),
              ],
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
      ).createShader(bounds),
      child: child,
    );
  }
}
