import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/layout/home_layout.dart';
import 'package:revive/modules/Admin/home_admin/homeAdmin.dart';
import 'package:revive/modules/LoginAndReg/component.dart';
import 'package:revive/modules/LoginAndReg/cubitForLogin/cubit.dart';
import 'package:revive/modules/LoginAndReg/cubitForLogin/state.dart';
import 'package:revive/modules/LoginAndReg/forget_screen.dart';
import 'package:revive/modules/LoginAndReg/register.dart';
import 'package:revive/modules/Owner/FactoryFootprint/questions_factory.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

// ignore: must_be_immutable
class loginScreen extends StatelessWidget {
  loginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  // bool ispassword = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is loginSuccessState) {
            if (state.loginModel.status!) {
              // print(state.loginModel.message);
              // print(state.loginModel.data!.token);
              // showToast(
              //     msg: state.loginModel.message!, state: toastStates.SUCCESS);
              if (state.loginModel.data!.role == 1) {
                sharedPref
                    .saveData(key: "token", value: state.loginModel.data!.token)
                    .then((value) {
                  navigateAndFinish(context, HomeAdmin());
                  sharedPref.saveData(
                      key: "role", value: state.loginModel.data!.role);
                  sharedPref.saveData(
                      key: "AdminName", value: state.loginModel.data!.name);
                  sharedPref.saveData(
                      key: "AdminEmail", value: state.loginModel.data!.email);
                });
              } else if (state.loginModel.data!.role == 2){
                sharedPref
                    .saveData(key: "token", value: state.loginModel.data!.token)
                    .then((value) {
                  navigateAndFinish(context, QuestionsFactory());
                  sharedPref.saveData(
                      key: "role", value: state.loginModel.data!.role);
                  sharedPref.saveData(
                      key: "profilePic", value: state.loginModel.data!.image);
                  sharedPref.saveData(
                      key: "username", value: state.loginModel.data!.name);
                  sharedPref.saveData(
                      key: "email", value: state.loginModel.data!.email);
                });
              }else{
                  sharedPref
                    .saveData(key: "token", value: state.loginModel.data!.token)
                    .then((value) {
                  navigateAndFinish(context, HomeLayout(index: 0,));
                  sharedPref.saveData(
                      key: "role", value: state.loginModel.data!.role);
                  sharedPref.saveData(
                      key: "profilePic", value: state.loginModel.data!.image);
                  sharedPref.saveData(
                      key: "username", value: state.loginModel.data!.name);
                  sharedPref.saveData(
                      key: "email", value: state.loginModel.data!.email);
                });
              }
            } else {
              //print(state.loginModel.message);
              showToast(
                  msg: state.loginModel.message!, state: toastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
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
                    image: AssetImage("assets/images/login_background_2.jpg"),
                    fit: BoxFit.cover,
                    //  colorFilter: ColorFilter.srgbToLinearGamma(),
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
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: Colors.white,
                  ),
                  height: double.infinity,
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 28.0, right: 18, top: 35),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildTextFormField(
                              text: "userName",
                              sufIcon: Icons.email,
                              textEditingController: emailController,
                              textInputType: TextInputType.emailAddress,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "Email must not be empty";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            buildTextFormField(
                              text: "Password",
                              sufIcon: cubit.ispassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              textEditingController: passwordController,
                              textInputType: TextInputType.visiblePassword,
                              onpressSuf: () {
                                cubit.changeShowPass();
                                // setState(() {
                                //   ispassword = !ispassword;
                                // });
                              },
                              onsubmit: (value) {
                                if (formKey.currentState!.validate()) {
                                  cubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              hidePassword: cubit.ispassword,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return "Password must not be empty";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  // bottomEmail(context);
                                  navigate(context, ForgetPassword());
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
                            ConditionalBuilder(
                              condition: state is! loginLoadingState,
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    // navigateAndFinish(
                                    //   context,
                                    //   HomeLayout(
                                    //     index: 0,
                                    //   ),
                                    // );
                                    if (formKey.currentState!.validate()) {
                                      cubit.userLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                      // print(emailController.text);
                                      // print(passwordController.text);
                                    }
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
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              fallback: (context) => CircularProgressIndicator(
                                  color: Colors.green),
                            ),
                            const SizedBox(
                              height: 45,
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
              ),
            ],
          ));
        },
      ),
    );
  }
}
