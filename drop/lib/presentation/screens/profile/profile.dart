import 'package:drop/core/colors/colors.dart';
import "package:flutter/material.dart";

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(
                  color: ConstantColors.dark,
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage(
                      "assets/images/profilepic.jpg",
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 148,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ConstantColors.dark,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Ashok",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ConstantColors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ConstantColors.dark,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.favorite_outline,
                    color: ConstantColors.green,
                  ),
                  Text(
                    "Liked",
                    style: TextStyle(
                        color: ConstantColors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: ConstantColors.green,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ConstantColors.dark,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.playlist_add,
                    color: ConstantColors.green,
                  ),
                  Text(
                    "Playlist",
                    style: TextStyle(
                        color: ConstantColors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: ConstantColors.green,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
