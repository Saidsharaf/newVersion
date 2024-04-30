import 'package:flutter/material.dart';
import 'package:revive/modules/LoginAndReg/login.dart';
import 'package:revive/modules/LoginAndReg/register.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [
          //     Color.fromARGB(255, 23, 184, 109),
          //     Color.fromARGB(255, 22, 55, 21),
          //   ],
          // ),
          image: DecorationImage(
            image: AssetImage(
              "assets/images/login_background_2.jpg",
            ),
            fit: BoxFit.cover,
           // colorFilter: ColorFilter.srgbToLinearGamma(),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              // const Padding(
              //   padding: EdgeInsets.only(top: 80.0),
              //   child: Image(image: AssetImage('assets/images/rev.png')),
              // ),
              const SizedBox(
                height: 47,
              ),
              const Text(
                'Welcome To Revive',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontFamily: "Zuume",
                ),
              ),
              const SizedBox(
                height: 370,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginScreen()));
                },
                child: Container(
                  height: 53,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Center(
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegScreen()));
                },
                child: Container(
                  height: 53,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white),
                  ),
                  child: const Center(
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              const Text(
                'Login with Social Media',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontFamily: "Inter",
                ),
              ), //
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(
                      'assets/images/github.png',
                    ),
                    height: 35,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 17.5,
                    child: const Image(
                      image: AssetImage(
                        'assets/images/google.png',
                      ),
                      height: 40,
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
