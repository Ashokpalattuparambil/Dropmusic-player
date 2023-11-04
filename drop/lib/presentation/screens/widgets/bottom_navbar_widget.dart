import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:drop/core/colors/colors.dart';
import "package:flutter/material.dart";

ValueNotifier<int> bottomnavListner = ValueNotifier(0);

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      Icon(
        Icons.home_max_rounded,
        color: ConstantColors.violet2,
      ),
      Icon(
        Icons.local_library,
        color: ConstantColors.violet2,
      ),
      Icon(
        Icons.my_library_music_outlined,
        color: ConstantColors.violet2,
      ),
    ];
    return ValueListenableBuilder(
      valueListenable: bottomnavListner,
      builder: ((context, int newindex, _) {
        return CurvedNavigationBar(
          height: 55,
          color: ConstantColors.dark,
          backgroundColor: ConstantColors.violet.withOpacity(0),
          buttonBackgroundColor: ConstantColors.dark,
          items: items,
          index: newindex,
          onTap: (index) {
            bottomnavListner.value = index;
          },
        );
      }),
    );
  }
}
