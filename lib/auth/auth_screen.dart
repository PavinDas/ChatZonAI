import 'package:chatzon_ai/screens/login_screen.dart';
import 'package:chatzon_ai/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  bool showLoginPage = true;

  toggleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(showRegisterPage: toggleScreens,);
    } else {
      return SignUpScreen(showLoginPage: toggleScreens,);
    }
  }
}