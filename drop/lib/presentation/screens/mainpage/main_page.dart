import 'package:drop/presentation/screens/all_music_list/musics.dart';
import 'package:drop/presentation/screens/home/homepage.dart';
import 'package:drop/presentation/screens/widgets/bottom_navbar_widget.dart';
import 'package:drop/presentation/screens/profile/profile.dart';
import "package:flutter/material.dart";

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomePage(),
      const Musics(),
      const Profile(),
    ];
    return Scaffold(
      extendBody: true,
      body: ValueListenableBuilder(
        valueListenable: bottomnavListner,
        builder: ((context, int index, _) {
          return pages[index];
        }),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
