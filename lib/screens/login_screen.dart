import 'package:chatzon_ai/constants/colors.dart';
import 'package:chatzon_ai/screens/forgot_password_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginScreen({super.key, required this.showRegisterPage});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //* Text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isVisible = true;

  signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  buttonTapped() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //* Hello text
                Text(
                  'Hello Again!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                    color: whiteColor,
                    letterSpacing: 1,
                  ),
                ),
                const Text(
                  'Welcome back',
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(
                  height: 95,
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
                        style: const TextStyle(
                          color: whiteColor
                        ),
                        controller: _emailController,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: textColor,
                            )),
                      ),
                    ),
                  ),
                ),

                //* Password textfield
                const SizedBox(
                  height: 20,
                ),
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
                        style: const TextStyle(
                          color: whiteColor
                        ),
                        controller: _passwordController,
                        obscureText: _isVisible ? true : false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: textColor),
                          suffixIcon: InkWell(
                            onTap: buttonTapped,
                            child: _isVisible
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: textColor,
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: textColor,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //* Forgot password
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //* Login button
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: signIn,
                  child: Container(
                    decoration: BoxDecoration(
                      color: secColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 167,
                        vertical: 16,
                      ),
                      child: Text(
                        'Sign  In',
                        style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),

                //* Register button
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Not a member?  ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: bgColor
                      ),
                    ),
                    InkWell(
                      onTap: widget.showRegisterPage,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                  ],
                ),
                // const Spacer(
                //   flex: 2,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
