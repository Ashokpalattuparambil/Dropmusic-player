import 'package:drop/core/colors/colors.dart';
import "package:flutter/material.dart";

class GridPlaylistBarWidget extends StatelessWidget {
  const GridPlaylistBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: ConstantColors.dark,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "POP",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: ConstantColors.green),
          ),
        ),
      ),
    );
  }
}
