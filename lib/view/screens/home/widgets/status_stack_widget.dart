import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rainery/view/widget/icon_gradiant_widget.dart';

class StatusStackWidget extends StatelessWidget {
  const StatusStackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: Stack(
        children: const [
          IconGradiantMask(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Icon(
                CupertinoIcons.circle_fill,
                size: 250,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Color(0xffFFB67F),
                    blurRadius: 10,
                    offset: Offset(-2, 0),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 1,
            left: 2,
            child: Icon(
              Icons.cloud_sharp,
              color: Color.fromARGB(221, 46, 49, 81),
              size: 150,
            ),
          ),
        ],
      ),
    );
  }
}
