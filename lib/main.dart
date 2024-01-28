import 'dart:async';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  var name = "example"; // this variable must have the name of user

  Widget build(BuildContext context) {
    return MaterialApp(
      home: DynamicBlueBackgroundLoginScreen(),
    );
  }
}

class DynamicBlueBackgroundLoginScreen extends StatefulWidget {
  const DynamicBlueBackgroundLoginScreen({super.key});
  @override
  State<DynamicBlueBackgroundLoginScreen> createState() =>
      _DynamicBlueBackgroundLoginScreenState();
}

class _DynamicBlueBackgroundLoginScreenState
    extends State<DynamicBlueBackgroundLoginScreen> {
  Color _backgroundColor = const Color(0xff003366);
  final Random _random = Random();

  List<Color> blueShades = [
    const Color(0xff0F4D92),
    const Color.fromARGB(255, 37, 53, 140),
    const Color(0xff003153),
    const Color(0xff003366)
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        _backgroundColor = blueShades[_random.nextInt(blueShades.length)];
      });
    });
  }

  void _launchGoogleMeet() async {
    final Uri url = Uri.parse('https://zoom.us/signin#/login');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var name = "example"; // this variable must have the name of user
    return Scaffold(
      //appBar: AppBar( backgroundColor:_backgroundColor ,title: const Center( child: Text("Home", style: TextStyle( color: Colors.white,fontSize: 44,fontWeight: FontWeight.bold,),),),) ,
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        color: _backgroundColor,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 500,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // first row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 200,
                          ),
                          Image.asset("images/logo.png", height: 170),
                        ],
                      ),
                      // second row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            (Icons.person),
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 40,
                          ),
                          Text(
                            " Name : " + name,
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          Container(height: 200),
                        ],
                      ),
                      // third row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            child: FloatingActionButton(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      color: Color(0xff003366),
                                      size: 110,
                                    ),
                                    Text(
                                      " Log out ",
                                      style: TextStyle(
                                        color: Color(0xff003366),
                                      ),
                                    )
                                  ],
                                ),
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      "login", (route) => false);
                                }),
                          ),
                          Container(
                            height: 200,
                            width: 20,
                            color: Color.fromARGB(0, 0, 51, 102),
                          ),
                          Container(
                            height: 150,
                            width: 150,
                            child: FloatingActionButton(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.upload,
                                      color: Color(0xff003366),
                                      size: 110,
                                    ),
                                    Text(
                                      " Upload ",
                                      style: TextStyle(
                                        color: Color(0xff003366),
                                      ),
                                    )
                                  ],
                                ),
                                onPressed: () {}),
                          ),
                        ],
                      ),
                      // forth row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 150,
                            width: 150,
                            child: FloatingActionButton(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.person_outline_rounded,
                                      color: Color(0xff003366),
                                      size: 110,
                                    ),
                                    Text(
                                      " Profile ",
                                      style: TextStyle(
                                        color: Color(0xff003366),
                                      ),
                                    )
                                  ],
                                ),
                                onPressed: () {}),
                          ),
                          Container(
                            height: 200,
                            width: 20,
                            color: Color.fromARGB(0, 0, 51, 102),
                          ),
                          Container(
                            height: 150,
                            width: 150,
                            child: FloatingActionButton(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.video_call_outlined,
                                      color: Color(0xff003366),
                                      size: 110,
                                    ),
                                    Text(
                                      " meeting ",
                                      style: TextStyle(
                                        color: Color(0xff003366),
                                      ),
                                    )
                                  ],
                                ),
                                onPressed: () {
                                  _launchGoogleMeet();
                                }),
                          ),
                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
