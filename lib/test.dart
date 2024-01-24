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
      title: 'Dynamic Blue Background Login',
      home: DynamicBlueBackgroundLoginScreen(),
    );
  }
}

class DynamicBlueBackgroundLoginScreen extends StatefulWidget {
  @override
  _DynamicBlueBackgroundLoginScreenState createState() =>
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
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        _backgroundColor = blueShades[_random.nextInt(blueShades.length)];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff003366),
        title: const Center(
          child: Text("Welcome",
              style: TextStyle(
                //alignment: Alignment.center,
                color: Colors.white,
                fontSize: 44,
                fontWeight: FontWeight.w600,
              )),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/imamu.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(255, 168, 194, 200), BlendMode.darken)),
        ),
        //duration: const Duration(seconds: 2),
        //color: _backgroundColor,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Icon(
                    Icons.account_circle,
                    color: Colors.white,
                    size: 210,
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color: Color(0xff003366),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      prefixIcon: Icon(
                        Icons.mail,
                        color: Color(0xff003366),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      iconColor: Color(0xff003366),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Color(0xff003366),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xff003366),
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    child: const Text('Login',
                        style: const TextStyle(
                            color: Color(0xff003366),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 251, 250, 250),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      // TODO: Implement login logic
                    },
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    child: const Text('Forgot Password?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    onPressed: () {
                      // TODO: Password recovery logic
                    },
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 3.5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
