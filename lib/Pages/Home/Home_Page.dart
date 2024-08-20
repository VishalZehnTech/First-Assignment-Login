// ignore_for_file: file_names
import 'dart:async';

import 'package:assignment_first_login/Pages/Views/Login_Page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 850), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LogInPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 7, 1, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Loading...",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 280,
              height: 5,
              child: LinearProgressIndicator(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
