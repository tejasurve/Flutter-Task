/*
 * Created on Sat Nov 02 2024
 * Created by Tejas Surve
 *
 * Copyright (c) Tejas Surve
 */
import 'package:flutter/material.dart';
import 'package:flutter_task/presentation/pages/reels_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  bool _visible = false;
  bool _fadeOut = false;

  @override
  void initState() {
    super.initState();
    _navigateToHomeScreen();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _visible = true;
      });
    });
  }

  void _navigateToHomeScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _fadeOut = true;
      });

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ReelsScreen(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 50, 49, 49),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(seconds: 2),
              child: Image.asset(
                'assets/images/welcome.png',
                height: 200,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Flutter App',
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Explore the world of Flutter',
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
