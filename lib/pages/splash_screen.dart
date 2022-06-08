import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_myapp/pages/Login.dart';
import 'package:flutter_myapp/pages/onBoardingPage.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   startTime();
  // }

  // startTime() async {
  //   var duration = Duration(seconds: 4);
  //   return new Timer(duration, route);
  // }

  // route() {
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(builder: (context) => Login()));
  // }

  @override
  Widget build(BuildContext context) {
    // return initWidget(context);
    return MaterialApp(
        title: 'Clean Code',
        home: AnimatedSplashScreen(
            duration: 2000,
            splash: 'asset/images/logo_pratham.png',
            nextScreen: const OnBoardingPage(),
            splashTransition: SplashTransition.fadeTransition,
            // pageTransitionType: PageTransitionType.scale,
            splashIconSize: 500.00,
            backgroundColor: Color.fromARGB(255, 255, 255, 255)));
  }
  //Icons.home
  // Widget initWidget(BuildContext context) {
  //   return Scaffold(
  //     body: Stack(
  //       children: [
  //         Container(
  //           decoration: const BoxDecoration(
  //               color: Color.fromARGB(255, 255, 252, 251),
  //               gradient: LinearGradient(colors: [(Color.fromARGB(255, 244, 242, 241)), Color.fromARGB(255, 12, 12, 12)],
  //                   begin: Alignment.topCenter,
  //                   end: Alignment.bottomCenter
  //               )
  //           ),
  //         ),
  //         // Center(
  //         //   child: Container(
  //         //     child: Image.asset("asset/images/login.png"),
  //         //   ),
  //         // )
  //       ],
  //     ),
  //   );
  // }
}
