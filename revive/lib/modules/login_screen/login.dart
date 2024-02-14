import 'package:flutter/material.dart';
import 'package:revive/layout/home_layout.dart';
import 'package:revive/shared/component/component.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/back1.png",
                  ),
                  fit: BoxFit.cover,
                  opacity: 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 32,
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(150),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(38, 41, 37, 0.29),
                    blurRadius: .5,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: Colors.green,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(38, 41, 37, 0.29),
                  blurRadius: .5,
                  offset: Offset(0, 1),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 75, right: 60),
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(38, 41, 37, 0.29),
                    blurRadius: .5,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 84, left: 30),
            child: Text(
              "LOgIN",
              textScaler: TextScaler.linear(1.5),
              style: TextStyle(
                letterSpacing: 2.3,
                color: Color.fromARGB(255, 9, 107, 60),
                fontSize: 34,
                fontFamily: "Reg",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 250,
              left: 20,
              right: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      fillColor: Colors.amber,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text("Forget the password ?",
                  style: TextStyle(
                          
                          fontSize: 18,
                          fontFamily: "Body"
                        ),
                        ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    children: [
                      Text(
                        "Sign in",
                        style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Body",
                        ),
                      ),
                      Spacer(),
                      FloatingActionButton(
                        onPressed: () {
                          navigateAndFinish(context, HomeLayout(index: 0));
                        },
                        backgroundColor: Colors.green,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      Text("Don't have account ? ",style: TextStyle(
                          fontSize: 14.5,
                          fontFamily: "Body"
                        ),
                        ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontFamily: "Body",
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
