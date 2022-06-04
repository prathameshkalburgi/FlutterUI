import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  var number = 123;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FLUTTER"),
      ),
      body: Center(
        child: Container(
          child:
              Text("Welcome to prathamesh my first flutter app $number"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
