import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:revive/modules/LoginAndReg/component.dart';
import 'package:revive/modules/LoginAndReg/cubitForReg/cubit.dart';
import 'package:revive/modules/LoginAndReg/cubitForReg/state.dart';
import 'package:revive/modules/LoginAndReg/login.dart';
import 'package:revive/shared/component/component.dart';

// ignore: must_be_immutable
class RegScreen extends StatelessWidget {
  RegScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmController = TextEditingController();
  var birthController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is registerSuccessState) {
            if (state.loginModel.status!) {
              // sharedPref
              //     .saveData(key: "token", value: state.loginModel.data!.token)
              //     .then((value) {
              //   token = state.loginModel.data!.token;
              //   navigateAndFinish(context, HomeLayout(index: 0),);
              // });
              // print("${state.loginModel.data!.token}");
              print(state.loginModel.message);
              showToast(
                  msg: state.loginModel.message!, state: toastStates.SUCCESS);
              navigateAndFinish(context, loginScreen());
            } else {
              showToast(
                  msg: state.loginModel.message!, state: toastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            body: Stack(
              //thanks for watching
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
                      colorFilter: ColorFilter.srgbToLinearGamma(),
                    ),
                  ),
                ),
                // const Padding(
                //   padding: EdgeInsets.only(top: 60.0, left: 22),
                //   child: Text(
                //     'Create Your\nAccount',
                //     style: TextStyle(
                //         fontSize: 30,
                //         color: Color.fromARGB(206, 255, 255, 255),
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 267.0),
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
                      padding: const EdgeInsets.only(
                        left: 28.0,
                        right: 18,
                        top: 38,
                      ),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildTextFormField(
                                text: "userName",
                                sufIcon: Icons.check,
                                textEditingController: nameController,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "Name must not be empty";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15),
                              // buildTextFormField(
                              //   text: "Phone or Gmail",
                              //   sufIcon: Icons.email,
                              //   textEditingController: emailController,
                              //   validate: (value) {
                              //     if (value!.isEmpty) {
                              //       return "Email must not be empty";
                              //     }
                              //     return null;
                              //   },
                              // ),
                              // SizedBox(height: 15),
                              buildTextFormField(
                                text: "Password",
                                sufIcon: cubit.ispassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                textEditingController: passwordController,
                                hidePassword: cubit.ispassword,
                                onpressSuf: () {
                                  cubit.changeShowPass();
                                },
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return "Password must not be empty";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15),
                              buildTextFormField(
                                text: "Confirm Password",
                                sufIcon: cubit.ispassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                textEditingController: confirmController,
                                onpressSuf: () {
                                  cubit.changeShowPass();
                                },
                                hidePassword: cubit.ispassword,
                                validate: (value) {
                                  if (value!.isEmpty ||
                                      value != passwordController.text) {
                                    return "doesn't match tha password";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 15),
                              buildTextFormField(
                                text: "Birthday",
                                textEditingController: birthController,
                                sufIcon: Icons.calendar_today_rounded,
                                ontap: () async {
                                  DateTime? pickDate = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime(1940),
                                    lastDate: DateTime.now(),
                                  );
                                  if (pickDate != null) {
                                    birthController.text =
                                        DateFormat("yyyy-MM-dd")
                                            .format(pickDate);
                                  }
                                },
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Text("Gender"),
                                  Radio(
                                    value: "male",
                                    groupValue: cubit.selectedValue,
                                    activeColor: Colors.green,
                                    onChanged: (value) {
                                      cubit.changeRadio(value);
                                      cubit.theGender = value;
                                    },
                                  ),
                                  Text("Male"),
                                  Radio(
                                    value: "female",
                                    groupValue: cubit.selectedValue,
                                    activeColor: Colors.green,
                                    onChanged: (value) {
                                      cubit.changeRadio(value);
                                      cubit.theGender = value;
                                    },
                                  ),
                                  Text("Female"),
                                  // RadioListTile(
                                  //   value: "male",
                                  //   groupValue: cubit.selectedValue,
                                  //   onChanged: (value) {
                                  //     cubit.changeRadio(value);
                                  //   },
                                  //   title: Text("Male"),
                                  // ),
                                ],
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                              ConditionalBuilder(
                                condition: state is! registerLoadingState,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        cubit.userRegister(
                                          username: nameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          gender: cubit.theGender,
                                          birthday: birthController.text,
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
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                fallback: (context) =>
                                    CircularProgressIndicator(
                                  color: Colors.green,
                                ),
                              ),
                              const SizedBox(
                                height: 38,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Already have account?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        navigateAndFinish(
                                            context, loginScreen());
                                      },
                                      child: Text(
                                        "Sign in",
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
            ),
          );
        },
      ),
    );
  }
}
