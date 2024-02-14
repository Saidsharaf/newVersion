import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(215, 236, 228, 155),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "U can order the Revive machine online from our app",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontFamily: "Revive",
              fontWeight: FontWeight.bold,
            ),
          ),
          Lottie.asset(
            "assets/lottie/email.json",
            repeat: true,
            reverse: true,
          ),
        ],
      ),
    );
  }
}
