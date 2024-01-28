import 'package:flutter/material.dart';
import 'package:newflutter3/meeting/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? Key}) : super(key: Key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or join a meeting',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Image.asset('images/onboarding.jpg'),
          ),
          CustomButton(
            text: 'Login',
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          )
        ],
      ),
    );
  }
}
