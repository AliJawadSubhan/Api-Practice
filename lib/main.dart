import 'package:api_asif/pages/home_page.dart';
import 'package:api_asif/pages/req_page.dart';
import 'package:flutter/material.dart';

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
        primaryColor: Colors.orange[100],
        appBarTheme: AppBarTheme(
          color: Colors.orange[100],
          elevation: 0.00,
        ),
        //  primaryColor: Colors.orange[100],
      ),
      home: AnotherAPI(),
    );
  }
}
