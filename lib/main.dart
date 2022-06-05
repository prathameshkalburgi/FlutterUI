import 'package:flutter/material.dart';
import 'package:flutter_myapp/pages/Home_Page.dart';
import 'package:flutter_myapp/pages/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      routes: {
        "/" : ((context) => Login()),
        "/HomePage" : ((context) => HomePage()),
        
      },
    );
  }
}
