import 'dart:io';

import 'package:code_school/Theme/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'Repositories/Storage/jwt_model.dart';
import 'Routes/routes.dart';
import 'Theme/light_theme.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:hive_flutter/hive_flutter.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(JWTModelAdapter());

    await Hive.openBox('jwt');


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


