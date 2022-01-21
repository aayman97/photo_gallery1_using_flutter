import 'dart:ui';

import 'package:flutter/material.dart';



class BackgroundImage extends StatefulWidget {
  BackgroundImage({Key? key}) : super(key: key);

  @override
  _BackgroundImageState createState() => _BackgroundImageState();
}

class _BackgroundImageState extends State<BackgroundImage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover
          )
      ),
      height: height,
      width: width,
      child: Center(
        child:ClipRect(
          child: BackdropFilter(filter: ImageFilter.blur(
            sigmaX: 0,
            sigmaY: 0,
          ),
          child: Container(
            color : Colors.white.withOpacity(0.1)
          ),
          ),
        ),
      ),
    );
  }
}