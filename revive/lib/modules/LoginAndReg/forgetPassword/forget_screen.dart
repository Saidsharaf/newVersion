import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:revive/modules/LoginAndReg/component.dart';
import 'package:revive/modules/LoginAndReg/forgetPassword/cubitForget/cubitPass.dart';
import 'package:revive/modules/LoginAndReg/forgetPassword/cubitForget/state.dart';
import 'package:revive/modules/LoginAndReg/forgetPassword/forget2_screen.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetCubit(),
      child: BlocConsumer<ForgetCubit, ForgetStates>(
        listener: (context, state) {
          if (state is forgetSuccessState) {
            if (state.forgetModel.status!) {
              navigateAndFinish(context, VerficationPass());
            } else {
              showToast(msg: state.forgetModel.msg!, state: toastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          var cubit = ForgetCubit.get(context);
          var emailController = TextEditingController();
          var formKey = GlobalKey<FormState>();
          // Widget _buildPasswordTextField() {
          //   return Container(
          //     margin: const EdgeInsets.only(right: 8.0),
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Container(
          //           margin: const EdgeInsets.only(top: 8.0),
          //           child: const Icon(Icons.alternate_email_sharp,
          //               color: Colors.green),
          //         ),
          //         const SizedBox(
          //           width: 10.0,
          //         ),
          //         Expanded(
          //           child: TextField(
          //             controller: emailController,
          //             onSubmitted: (value) {
          //               cubit.userForget(gmail: emailController.text);

          //             },
          //             style: TextStyle(
          //               fontSize: 18.0,
          //               fontWeight: FontWeight.w600,
          //             ),
          //             decoration: InputDecoration(
          //               hintText: "Email",
          //               hintStyle: TextStyle(
          //                   fontSize: 18.0,
          //                   fontWeight: FontWeight.w500,
          //                   color: Color.fromARGB(255, 102, 173, 105)),
          //               border: UnderlineInputBorder(
          //                 borderSide: BorderSide(
          //                   color: Colors.green,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   );
          // }

//----------
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
                color: Color.fromARGB(255, 102, 173, 105),
                onPressed: () {
                  cubit.userForget(gmail: emailController.text);
                  // navigateAndFinish(context, VerficationPass());
                },
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
                          Form(
                            key: formKey,
                            child: Column(
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
                                    color:
                                        const Color.fromARGB(255, 29, 28, 28),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                              ],
                            ),
                          ),
                          defultFormField(
                            lable: "Email",
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            msg: "Email isn't valid",
                            onSumbmit: (p0) {
                              if (formKey.currentState!.validate()) {
                                cubit.userForget(gmail: emailController.text);
                                sharedPref.saveData(
                                    key: "forgEmail",
                                    value: emailController.text);
                              }
                            },
                          ),
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
        },
      ),
    );
  }
}
