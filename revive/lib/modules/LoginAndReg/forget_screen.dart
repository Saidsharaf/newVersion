import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:revive/modules/LoginAndReg/forget2_screen.dart';
import 'package:revive/modules/LoginAndReg/login.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    Widget _buildPasswordTextField() {
      return Container(
        margin: const EdgeInsets.only(right: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8.0),
              child:
                  const Icon(Icons.alternate_email_sharp, color: Colors.green),
            ),
            const SizedBox(
              width: 10.0,
            ),
            const Expanded(
              child: TextField(
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color:Color.fromARGB(255, 102, 173, 105)),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildResetBtn() {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          elevation: 2.0,
          highlightElevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          color:Color.fromARGB(255, 102, 173, 105),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => VerficationPass())),
          child: Text(
            "Reset Password",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }
  return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(top: 30, left: 25.0, right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8.0,
              ),
              Expanded(
                flex: 5,
                child: SvgPicture.asset(
                  "assets/icons/forget_password.svg",
                ),
              ),
              Expanded(
                flex: 8,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Forgot Password",
                          style: TextStyle(
                            color: Color.fromARGB(255, 102, 173, 105),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "Provide Your email and we will send you a link to reset your password",
                          style: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 29, 28, 28),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                    _buildPasswordTextField(),
                    const SizedBox(height: 50.0),
                    _buildResetBtn(),
                  //  const SizedBox(height: 30.0),
                   // _buildBackBtn(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
