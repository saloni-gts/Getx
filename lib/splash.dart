import 'package:flutter/material.dart';
import 'package:getx/addresspage.dart';
import 'package:getx/upiPayment.dart';

import 'chair.dart';
import 'firstScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {

Future.delayed(Duration(seconds: 2), () {
  Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoardMain()));

});
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Image.asset(
                  "assets/images/dog_image3.png",
                ),
              ))),
    );
  }
}
