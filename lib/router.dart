import 'package:flutter/material.dart';
import 'screens/home.screen.dart';

class AppRouter {
  static const String home = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Route not found'),
            ),
          ),
        );
    }
  }
}
