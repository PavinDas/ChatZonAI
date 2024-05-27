import 'dart:developer';

import 'package:chatzon_ai/constants/colors.dart';
import 'package:chatzon_ai/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  sendResetEmail() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text(
            'Password reset link send to your email',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.deepPurple[200]?.withOpacity(.2),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      );
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: const Text(
            'Please check your email address and try again',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.deepPurple[200]?.withOpacity(.2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Enter your email address',
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            //* Email textfield
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: secColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: secColor,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 25,
            ),
            //* Submit button
            CustomButton(
              onTap: sendResetEmail,
              text: 'Send Reset Email',
            ),
          ],
        ),
      ),
    );
  }
}
