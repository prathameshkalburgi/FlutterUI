import 'package:flutter/material.dart';

void snackBarShow(BuildContext context, String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          // backgroundColor: Color.fromARGB(255, 249, 247, 247),
          behavior: SnackBarBehavior.floating,
          content: Container(
              padding: const EdgeInsets.all(20),
              height: 90,
              decoration: const BoxDecoration(
                // color: Color(0xFFC72C41),
                borderRadius: BorderRadius.all(Radius.circular(20)),
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
              )),
        ),
      );
    }

    void showDialogeBox(BuildContext context, String message) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          // backgroundColor: Color.fromARGB(255, 211, 152, 105),
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