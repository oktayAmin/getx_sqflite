import 'package:flutter/material.dart';
import 'package:flutter_getx_sqlite/view/screens/home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        color: Colors.white,
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        darkTheme: ThemeData.light(
          useMaterial3: true,
        ),
        // textDirection: TextDirection.rtl,
        themeMode: ThemeMode.dark,
        home: HomeScreen());
  }
}
