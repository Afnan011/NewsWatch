import 'package:flutter/material.dart';
import 'package:news_watch/view/home.dart';
import 'package:news_watch/view/splashScreen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Watch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        splash: const SplashScreen(),
        duration: 1500,
        splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: ,
        backgroundColor: Colors.black38,
        nextScreen: HomeScreen(),
      ),
    );
  }
}