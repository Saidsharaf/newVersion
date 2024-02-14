import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage4 extends StatelessWidget {
  const IntroPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(223, 236, 191, 155),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "U can post and communicate with other people",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontFamily: "Revive",
              fontWeight: FontWeight.bold,
            ),
          ),
          Lottie.asset(
            "assets/lottie/post.json",
            repeat: true,
            reverse: true,
          ),
        ],
      ),
    );
  }
}
