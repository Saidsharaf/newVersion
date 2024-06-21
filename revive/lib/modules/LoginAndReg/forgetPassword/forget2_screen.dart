import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:revive/modules/LoginAndReg/component.dart';
import 'package:revive/modules/LoginAndReg/forgetPassword/cubitCodeVerfi/cubit.dart';
import 'package:revive/modules/LoginAndReg/forgetPassword/cubitCodeVerfi/state.dart';
import 'package:revive/modules/LoginAndReg/forgetPassword/new_password.dart';
import 'package:revive/shared/component/component.dart';

class VerficationPass extends StatelessWidget {
  const VerficationPass({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CodeCubit(),
      child: BlocConsumer<CodeCubit, CodeStates>(
        listener: (context, state) {
          if (state is codeSuccessState) {
            if (state.codeModel.status!) {
              navigateAndFinish(context, NewPassword());
            } else {
              showToast(msg: state.codeModel.msg!, state: toastStates.ERROR);
            }
          }
        },
        builder: (context, state) {
          var controller1 = TextEditingController();
          var controller2 = TextEditingController();
          var controller3 = TextEditingController();
          var controller4 = TextEditingController();
          var controller5 = TextEditingController();
          var controller6 = TextEditingController();
          var cubit = CodeCubit.get(context);
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
                              controller: controller1,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
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
                              controller: controller2,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
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
                              controller: controller3,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
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
                              controller: controller4,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
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
                              controller: controller5,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
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
                              controller: controller6,
                              onFieldSubmitted: (value) {
                                var code = controller1.text +
                                    controller2.text +
                                    controller3.text +
                                    controller4.text +
                                    controller5.text +
                                    controller6.text;
                                print(code);
                                cubit.userCode(code: int.tryParse(code));
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                border: UnderlineInputBorder(
                                    borderSide: BorderSide.none),
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
                          // navigateAndFinish(context, NewPass());
                          if (controller6.text.isNotEmpty) {
                            var code = controller1.text +
                                controller2.text +
                                controller3.text +
                                controller4.text +
                                controller5.text +
                                controller6.text;
                            print(code);
                            //  cubit.userCode(code: int.tryParse(code));
                            context.read<CodeCubit>().userCode(code: int.tryParse(code));
                          }
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
        },
      ),
    );
  }
}
