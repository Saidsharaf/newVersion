import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:revive/modules/LoginAndReg/welcome_screen.dart';
import 'package:revive/modules/login_screen/login.dart';
import 'package:revive/modules/onBoarding/intro_page1.dart';
import 'package:revive/modules/onBoarding/intro_page2.dart';
import 'package:revive/modules/onBoarding/intro_page3.dart';
import 'package:revive/modules/onBoarding/intro_page4.dart';
import 'package:revive/modules/onBoarding/intro_page5.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/local/shared_pref.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<OnBoarding> {
  var boardController = PageController();

  bool isLast = false;
  void submit() {
    sharedPref.saveData(key: "onBoarding", value: true).then((value) {
      if (value) {
        navigateAndFinish(context, WelcomeScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                isLast = (index == 4);
              });
            },
            controller: boardController,
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
              IntroPage4(),
              IntroPage5(),
            ],
          ),
          Container(
            alignment: Alignment(0, .75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    boardController.jumpToPage(4);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.5,
                      fontFamily: "Name",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: boardController,
                  count: 5,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Color.fromARGB(255, 5, 173, 103),
                    dotHeight: 10,
                    expansionFactor: 3,
                    dotWidth: 10,
                    spacing: 5.0,
                  ),
                ),
                //_________________________________________________________
                isLast
                    ? GestureDetector(
                        onTap: () {
                          submit();
                        },
                        child: Text(
                          "Done",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.5,
                            fontFamily: "Name",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          boardController.nextPage(
                              duration: Duration(microseconds: 1000),
                              curve: Curves.easeOutCubic);
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.5,
                            fontFamily: "Name",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
