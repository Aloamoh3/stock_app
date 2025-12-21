import 'package:flutter/material.dart';
import 'screens/home.screen.dart';
import 'screens/card.screen.dart';
import 'screens/dashboard.screen.dart';
import 'widgets/action.button.dart';
import 'widgets/investement.card.dart';

void main() {
  runApp(const FinanceApp());
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}



