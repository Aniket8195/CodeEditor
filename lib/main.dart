import 'package:code_school/Theme/dark_theme.dart';
import 'package:flutter/material.dart';
import 'Routes/routes.dart';
import 'Screens/HomeScreen/home_page.dart';
import 'Theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code School',
      theme: lightTheme,
      darkTheme: darkTheme,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: "/first",
    );
  }
}


