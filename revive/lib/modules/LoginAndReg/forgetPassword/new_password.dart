import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:revive/modules/LoginAndReg/component.dart';
import 'package:revive/modules/LoginAndReg/forgetPassword/cubitCodeVerfi/cubit.dart';
import 'package:revive/modules/LoginAndReg/forgetPassword/cubitCodeVerfi/state.dart';
import 'package:revive/modules/LoginAndReg/login.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => CodeCubit(),
      child: BlocConsumer<CodeCubit, CodeStates>(
        listener: (context, state) {
          if (state is newPassSuccessState) {
            if (state.newPassModel.status!) {
              navigateAndFinish(context, loginScreen());
            } else {
              showToast(msg: state.newPassModel.msg!, state: toastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          var cubit = CodeCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      height: 260,
                      width: double.infinity,
                      child: SvgPicture.asset(
                        "assets/icons/pass.svg",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 200,
                      child: FlutterPwValidator(
                        controller: passwordController,
                        minLength: 6,
                        uppercaseCharCount: 2,
                        lowercaseCharCount: 2,
                        numericCharCount: 3,
                        specialCharCount: 1,
                        width: 400,
                        height: 150,
                        onSuccess: () {},
                        onFail: () {},
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // navigate(context, loginScreen());
                          cubit.userNewPass(
                              gmail: sharedPref.getData(key: "forgEmail"),
                              password: passwordController.text);
                          showToast(
                              msg: "New password is saved",
                              state: toastStates.SUCCESS);
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
                            "SAVE",
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
        },
      ),
    );
  }
}
