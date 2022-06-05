import 'package:flutter/material.dart';
import 'package:flutter_myapp/pages/home_Page.dart';
import 'package:flutter_myapp/pages/login.dart';
import 'package:flutter_myapp/utils/myRoutes.dart';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      routes: {
        "/" : ((context) => const Login()),
        MyRoutes.HomePage : ((context) => const HomePage()),
        
      },
    );
  }
}
