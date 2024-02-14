import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 145, 211, 184),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "U can know the footprint for you and your factory from our app ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontFamily: "Revive",
              fontWeight: FontWeight.bold,
            ),
          ),
          Lottie.asset(
            "assets/lottie/lap.json",
            repeat: true,
            reverse: true,
          ),
        ],
      ),
    );
  }
}
