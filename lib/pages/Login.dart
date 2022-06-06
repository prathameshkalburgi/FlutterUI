import 'package:flutter/material.dart';
import 'package:flutter_myapp/utils/myRoutes.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  // static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          body: const MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            // Image.asset("asset/images/login.png"),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(40),
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                )),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // forgot password screen
              },
              child: const Text(
                'Forgot Password',
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () async {
                    // print(nameController.text);
                    // print(passwordController.text);

                    // Navigator.of(context, rootNavigator: true).pushNamed(MyRoutes.HomePage);

                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                              email: nameController.text,
                              password: passwordController.text);
                      var user = userCredential.user;
                      if (user != null) {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed(MyRoutes.HomePage);
                        print("successfull logined");
                      } 
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                        // showDialogeBox(context, "No user found for that email.");
                        snackBarShow(context, "No user found for that email.");
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                        snackBarShow(context, "Wrong password provided for that user.");
                      }
                    }
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
            ),
          ],
        ));
  }

  void snackBarShow(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // backgroundColor: Color.fromARGB(255, 249, 247, 247),
        behavior: SnackBarBehavior.floating,
        content: Container(
            padding: const EdgeInsets . all (20),
            height: 90,
            decoration: const BoxDecoration (
              // color: Color(0xFFC72C41),
                borderRadius : BorderRadius.all(Radius.circular(20)
                ),
        ),  
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const Text(
              "Oh snap!",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Text(
              "$message",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )
      ),
      ),
    );
  }

  void showDialogeBox(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Message'),
        content: Text('$message'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'))
        ],
      ),
    );
  }
}
