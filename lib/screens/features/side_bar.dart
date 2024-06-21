import 'package:chatzon_ai/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: secColor,
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: mainColor,
                  foregroundColor: whiteColor,
                  child: Icon(Icons.person),
                ),
                title: Text(
                  FirebaseAuth.instance.currentUser!.displayName.toString(),
                  style: TextStyle(
                    color: whiteColor,
                  ),
                ),
                subtitle: Text(
                  FirebaseAuth.instance.currentUser!.email.toString(),
                  style: TextStyle(color: textColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
