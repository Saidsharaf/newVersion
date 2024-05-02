import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:revive/modules/LoginAndReg/forgetPassword/new_password.dart';
import 'package:revive/shared/component/component.dart';

class VerficationPass extends StatefulWidget {
  const VerficationPass({super.key});

  @override
  State<VerficationPass> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<VerficationPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 260,
                width: double.infinity,
                //color: Colors.amber,
                child: SvgPicture.asset(
                  "assets/icons/verifi1.svg",
                ),
              ),
              //Image.asset('assets/images/back1.png',height: 250,width: double.infinity,),
              const SizedBox(height: 16),
              const Text(
                'Verification code',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Frank"),
              ),
              const SizedBox(height: 5),
              const Text(
                'we have sent verification code to ',
                style: TextStyle(
                    fontSize: 14, fontFamily: "Body", color: Colors.grey),
              ),
              const SizedBox(height: 32),
              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 68,
                      width: 50,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 50,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 50,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 50,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 50,
                      child: TextFormField(
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 68,
                      width: 50,
                      child: TextFormField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                        ),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    navigate(context, NewPass());
                  },
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 102, 173, 105),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                        child: Text(
                      "CONFIRM",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
