// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:newflutter3/main.dart';
import 'package:newflutter3/meeting/screens/home_screen.dart';
import 'package:newflutter3/meeting/screens/login_screen.dart';
import 'package:newflutter3/meeting/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? Key}) : super(key: Key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom clone',
      theme: ThemeData.dark(),
      routes: {
        '/login':(context) => const LoginScreen(),
        '/home':(context) => const HomeScreen(),
      },
      home: const LoginScreen(), 
    );
  }
}
