import 'package:flutter/material.dart';
import 'package:sample_chat/features/home/Homescreen.dart';
import 'package:sample_chat/features/login/login_screen.dart';
import 'package:sample_chat/features/otp/otp_screen.dart';
import 'package:sample_chat/features/splash/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),
    );
  }
}


