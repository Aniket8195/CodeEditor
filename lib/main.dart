import 'package:code_school/Theme/dark_theme.dart';
import 'package:flutter/material.dart';
import 'Routes/routes.dart';
import 'Theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Code School',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: MyRouter().router,
    );
  }
}


