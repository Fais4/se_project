// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      home: Login(), // The loginPage class.
    );
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginPage();
}

class LoginPage extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The top bar of the page.
        backgroundColor: const Color(0xff003366),
        title: const Center(
          child: Text("Welcome",
              style: TextStyle(
                color: Colors.white,
                fontSize: 44,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
      body: Container(
        // The Container which hold all the functions of the page.
        decoration: const BoxDecoration(
          image: DecorationImage(
              // The background image of the page
              image: AssetImage("images/imamu.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromARGB(255, 168, 194, 200), BlendMode.darken)),
        ),
        child: Center(
          // Creates a widget that centers its child.
          child: SingleChildScrollView(
            // Creates a box in which a single widget can be scrolled.
            child: Padding(
              // Creates a widget that insets its child.
              padding: const EdgeInsets.all(20.0),
              child: Column(
                // Creates a vertical array of children.
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Icon(
                    // The Account icon
                    Icons.account_circle,
                    color: Colors.white,
                    size: 210,
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    // The Email Registration field.
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
                    controller: email,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    // The Password Registration field.
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
                    controller: password,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    // The Login button.
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 251, 250, 250),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () async {
                      try {
                        final credential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email.text, password: password.text);
                        Navigator.of(context).pushReplacementNamed("homepage");
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                    },
                    child: const Text('Login',
                        style: TextStyle(
                            color: Color(0xff003366),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    // Forgot Password option button.
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
                    // Material Design down the page
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
