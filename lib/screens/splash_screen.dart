import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/login_screen.dart';

class NewsSplashScreen extends StatefulWidget {
  const NewsSplashScreen({super.key});

  @override
  State<NewsSplashScreen> createState() => _NewsSplashScreenState();
}

class _NewsSplashScreenState extends State<NewsSplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Color(0xff0e1935),
                    Color.fromARGB(255, 34, 63, 129),
                    Color.fromARGB(255, 39, 72, 148),
                    // Color.fromARGB(255, 28, 52, 107),
                    Color.fromARGB(255, 22, 40, 83),
                    Color(0xff0e1935),
                  ])),
            ),
            const Center(
              child: Image(
                image: AssetImage("assets/news_splash_logo.png"),
                width: 200,
              ),
            ),
            Positioned(
              top: size.height * 0.7,
              left: size.width * 0.46,
              child: const SpinKitWave(
                size: 30,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
