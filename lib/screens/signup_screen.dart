import 'package:chatzon_ai/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignUpScreen({super.key, required this.showLoginPage});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //* Text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  final _nameController = TextEditingController();
  bool _isVisible = true;

  signUp() async {
    if (passwordConfirmed()) {
      //? Create New User
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // //? Add User Details
      // addUserDetails(
      //   _emailController.text.trim(),
      //   _nameController.text.trim(),
      // );
    }
  }

  addUserDetails(String name, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'email': email,
    });
    // userData(
    //     _nameController.toString().trim(), _emailController.toString().trim());
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _passwordConfirmController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _nameController.dispose();
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
                  'Hello There!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 46,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: whiteColor,
                  ),
                ),
                const Text(
                  'Register now',
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(
                  height: 95,
                ),

                const SizedBox(
                  height: 20,
                ),

                //*  name textfield
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
                        style: const TextStyle(color: whiteColor),
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Full name',
                          hintStyle: TextStyle(color: textColor),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                        style: const TextStyle(color: whiteColor),
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: TextStyle(color: textColor),
                        ),
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
                        style: const TextStyle(color: whiteColor),
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(color: textColor),
                        ),
                      ),
                    ),
                  ),
                ),

                //* Password confirm textfield
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
                        style: const TextStyle(color: whiteColor),
                        controller: _passwordConfirmController,
                        obscureText: _isVisible ? true : false,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm password',
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

                //* Login button
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: signUp,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: secColor.withOpacity(.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                //* Forget password button
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already registered?  ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: bgColor),
                    ),
                    InkWell(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        'LogIn now',
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
