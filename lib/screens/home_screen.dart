import 'package:chatzon_ai/constants/consts.dart';
import 'package:chatzon_ai/constants/global.dart';
import 'package:chatzon_ai/helper/pref.dart';
import 'package:chatzon_ai/models/home_type.dart';
import 'package:chatzon_ai/widgets/home_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnboarding = false;
  }

  @override
  Widget build(BuildContext context) {
    //* Initializing device size
    mq = MediaQuery.sizeOf(context);

    // APIs.getAnswer('Hiii');

    return Scaffold(
      //! AppBar
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: const Text(
          appName,
          style: TextStyle(
            color: whiteColor,
            fontFamily: bold,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(
              right: 20,
              bottom: 3,
            ),
            onPressed: signout,
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      //! Body
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: mq.width * .018,
            vertical: mq.height * .015,
          ),
          children: HomeType.values
              .map(
                (e) => HomeCard(
                  homeType: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
