import 'package:drop/core/colors/colors.dart';
import "package:flutter/material.dart";

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      decoration: BoxDecoration(
        color: ConstantColors.dark,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: const AssetImage("assets/images/Droplogo.png"),
            backgroundColor: ConstantColors.dark,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Text(
              "Feel the drop",
              style: TextStyle(
                  color: ConstantColors.violet2,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Icon(
            Icons.search,
            color: ConstantColors.green,
          )
        ],
      ),
    );
  }
}
