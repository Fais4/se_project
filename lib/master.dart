import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newflutter3/auth/page1.dart';
import 'package:newflutter3/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        "login" : (context) => Login()
      },
    );
  }
}
