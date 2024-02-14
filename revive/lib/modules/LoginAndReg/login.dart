import 'package:flutter/material.dart';
import 'package:revive/layout/home_layout.dart';
import 'package:revive/modules/LoginAndReg/register.dart';
import 'package:revive/shared/component/component.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        body: Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            // gradient: LinearGradient(colors: [
            //   Color.fromARGB(255, 23, 184, 109),
            //   Color.fromARGB(255, 22, 55, 21),
            // ]),
            image: DecorationImage(
              image: AssetImage("assets/images/plant1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          // child: Column(
          //   children: [
          //     Image.asset("assets/images/grass.png",fit: BoxFit.fill,),
          //   ],
          // ),
        ),
        // const Padding(
        //     padding: EdgeInsets.only(top: 80.0, left: 22),
        //     child: Text(
        //       'Hello\nSign in!',
        //       style: TextStyle(
        //           fontSize: 30,
        //           color: Color.fromARGB(206, 255, 255, 255),
        //           fontWeight: FontWeight.bold,
        //           ),
        //     ),
        //   ),
        Padding(
          padding: const EdgeInsets.only(top: 330.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white,
            ),
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 18, top: 25),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        fontFamily: "Body",
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          left: 10,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.check,
                          color: Colors.grey,
                        ),
                        label: Text(
                          'Gmail',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 23, 184, 109),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    const TextField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      cursorColor: Colors.grey,
                      style: TextStyle(fontFamily: "Body"),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            left: 10,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ),
                          ),
                          suffixIcon: Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          label: Text(
                            'Password',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 23, 184, 109),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          bottomEmail(context);
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Color.fromARGB(255, 95, 86, 3),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigateAndFinish(
                          context,
                          HomeLayout(
                            index: 0,
                          ),
                        );
                      },
                      child: Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 23, 184, 109),
                            Color.fromARGB(255, 22, 55, 21),
                          ]),
                        ),
                        child: const Center(
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Don't have account?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              navigateAndFinish(context, RegScreen());
                            },
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Color.fromARGB(255, 95, 86, 3),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
