import 'package:drop/core/colors/colors.dart';
import 'package:drop/presentation/screens/home/widgets/grid_playlist_bar_widget.dart';
import 'package:drop/presentation/screens/widgets/appbar_widget.dart';
import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppBarWidget(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 130,
                height: 110,
                decoration: BoxDecoration(
                  color: ConstantColors.dark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.favorite_outline,
                      color: ConstantColors.green,
                      size: 35,
                    ),
                    Text(
                      "Liked",
                      style: TextStyle(
                          color: ConstantColors.green,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                width: 130,
                height: 110,
                decoration: BoxDecoration(
                  color: ConstantColors.dark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.playlist_add,
                      color: ConstantColors.green,
                      size: 35,
                    ),
                    Text(
                      "Playlist",
                      style: TextStyle(
                          color: ConstantColors.green,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Your playlists",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ConstantColors.green),
          ),
        ),
        Flexible(
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                childAspectRatio: 3 / 2,
                maxCrossAxisExtent: 200,
                mainAxisExtent: 180),
            itemBuilder: ((context, index) {
              return const GridPlaylistBarWidget();
            }),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
