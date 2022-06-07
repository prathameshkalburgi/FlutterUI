import 'package:flutter/material.dart';
import 'package:flutter_myapp/pages/home_Page.dart';
import 'package:flutter_myapp/pages/login.dart';
import 'package:flutter_myapp/pages/splash_screen.dart';
import 'package:flutter_myapp/utils/myRoutes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_myapp/widgets/themes.dart';

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
      theme: MyTheme.lightTheme(context),
    
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : ((context) => SplashScreen()),
        MyRoutes.login : ((context) =>  const Login()),
        MyRoutes.HomePage : ((context) =>  const HomePage()),
        
      },
    );
  }
}
