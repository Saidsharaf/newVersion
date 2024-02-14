import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 83, 145, 126),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Help us make better world",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontFamily: "Revive",
              fontWeight: FontWeight.bold,
            ),
          ),
          Lottie.asset("assets/lottie/bicycle.json",repeat: true,reverse: true,),
        ],
      ),
    );
  }
}
