import 'package:flutter/material.dart';
import 'screens/home.screen.dart';
import 'utils/app.colors.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance App',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.darkBackground,
        fontFamily: "Poppins",
      ),
      home: const HomeScreen(),
    );
  }
}


