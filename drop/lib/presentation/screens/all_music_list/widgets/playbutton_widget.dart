import 'package:drop/core/colors/colors.dart';
import "package:flutter/material.dart";

class PlayButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final Widget icon;
  const PlayButtonWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration:
          BoxDecoration(color: ConstantColors.dark, shape: BoxShape.circle),
      child: icon,
    );
  }
}
