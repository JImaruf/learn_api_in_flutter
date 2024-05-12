import 'package:flutter/material.dart';
import 'package:learnapi/pages/SignUpPage.dart';
import 'package:learnapi/pages/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                side: BorderSide(color: Colors.grey, width: 2.5))),
        inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.green),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.grey)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.red)),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.cyan)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.grey)),
            border: OutlineInputBorder()),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
