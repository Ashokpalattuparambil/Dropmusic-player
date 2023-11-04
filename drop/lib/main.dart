import 'package:drop/core/colors/colors.dart';
import 'package:drop/presentation/screens/mainpage/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of  application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: ConstantColors.violet,
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
