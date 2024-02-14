import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage5 extends StatelessWidget {
  const IntroPage5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(213, 9, 114, 41),
      //Color.fromARGB(213, 9, 114, 41),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Let's start the app ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontFamily: "Revive",
              fontWeight: FontWeight.bold,
            ),
          ),
          Lottie.asset(
            "assets/lottie/done.json",
            repeat: true,
            reverse: true,
          ),
        ],
      ),
    );
  }
}
