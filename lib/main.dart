import 'package:flutter/material.dart';
import 'package:flutter_myapp/pages/home_Page.dart';
import 'package:flutter_myapp/pages/login.dart';
import 'package:flutter_myapp/pages/splash_screen.dart';
import 'package:flutter_myapp/utils/myRoutes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_myapp/widgets/themes.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get _initialization async => ({
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SplashScreen();
          }
          return const CircularProgressIndicator();
        },
      ),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      // darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      // initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
      routes: {
        "/" : ((context) => SplashScreen()),
        MyRoutes.login: ((context) => const Login()),
        MyRoutes.HomePage: ((context) => const HomePage()),
      },
    );
  }
}
