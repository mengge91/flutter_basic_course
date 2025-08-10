import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/basic_widgets_screen.dart';
import 'screens/layout_widgets_screen.dart';
import 'screens/input_widgets_screen.dart';
import 'screens/navigation_screen.dart';
import 'screens/state_management_screen.dart';
import 'screens/animation_screen.dart';

void main() {
  runApp(const FlutterBasicCourseApp());
}

class FlutterBasicCourseApp extends StatelessWidget {
  const FlutterBasicCourseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter基础课程',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
      home: const HomeScreen(),
      routes: {
        '/basic_widgets': (context) => const BasicWidgetsScreen(),
        '/layout_widgets': (context) => const LayoutWidgetsScreen(),
        '/input_widgets': (context) => const InputWidgetsScreen(),
        '/navigation': (context) => const NavigationScreen(),
        '/state_management': (context) => const StateManagementScreen(),
        '/animation': (context) => const AnimationScreen(),
      },
    );
  }
}
