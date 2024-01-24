
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DynamicBlueBackgroundLoginScreen(),
    );
  }
}

class DynamicBlueBackgroundLoginScreen extends StatefulWidget {
  @override
  _DynamicBlueBackgroundLoginScreenState createState() => _DynamicBlueBackgroundLoginScreenState();
}

class _DynamicBlueBackgroundLoginScreenState extends State<DynamicBlueBackgroundLoginScreen> {
  Color _backgroundColor = const Color(0xff003366);
  final Random _random = Random();

  List<Color> blueShades = [
    const Color(0xff0F4D92),
    const Color.fromARGB(255, 37, 53, 140),
    const Color(0xff003153),
    const Color(0xff003366),
  ];

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        _backgroundColor = blueShades[_random.nextInt(blueShades.length)];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        color: _backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(width: 10),
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2,
                      fillColor: Colors.white,
                      padding: EdgeInsets.all(15),
                      shape: CircleBorder(),
                      child: Icon(Icons.person_sharp, color: _backgroundColor, size: 40),
                    ),
                    Container(height: 10),
                    RawMaterialButton(
                      onPressed: () {},
                      elevation: 2,
                      fillColor: Colors.white,
                      padding: EdgeInsets.all(15),
                      shape: CircleBorder(),
                      child: Icon(Icons.arrow_back_rounded, color: _backgroundColor, size: 40),
                    ),
                  ],
                ),
                Container(width: 200),
                Image.asset("images/logo.png", height: 150),
              ],
            ),
            Container(height: 380), // Added space between the first row and the second row
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: FloatingActionButton(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload, color: Color(0xff003366), size: 110),
                        Text("Upload content", style: TextStyle(color: Color(0xff003366))),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  child: FloatingActionButton(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.assignment, color: Color(0xff003366), size: 110),
                        Text("Set Grades", style: TextStyle(color: Color(0xff003366))),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCustomButton(Icons.settings, "Settings", () {
                        // Settings button
                      }),
                      _buildCustomButton(Icons.notifications, "Notifications", () {
                        // Notifications button
                      }),
                      _buildCustomButton(Icons.help, "Help", () {
                        //  Help button
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomButton(IconData icon, String label, Function onPressed) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextButton(
        onPressed: onPressed as void Function()?,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: _backgroundColor, size: 30),
            SizedBox(height: 5),
            Text(label, style: TextStyle(color: _backgroundColor)),
          ],
        ),
      ),
    );
  }
}
//now im in new branch guys
