import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:revive/modules/Owner/FactoryFootprint/cubit.dart';
import 'package:revive/modules/Owner/FactoryFootprint/state.dart';
import 'package:revive/modules/footprint_screen/questions.dart';
import 'package:revive/shared/component/component.dart';

class FootprintCustomer extends StatelessWidget {
  const FootprintCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarbonFactoryCubit(),
      child: BlocConsumer<CarbonFactoryCubit, CarbonFactoryStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 17,
                right: 12,
                left: 12,
                bottom: 17,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(38, 41, 37, 0.29),
                          blurRadius: 15,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    // padding: EdgeInsets.only(
                    //   top: 20,
                    //   right: 10,
                    //   left: 10,
                    //   bottom: 5,
                    // ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset("assets/images/footprint.jpg",
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(38, 41, 37, 0.29),
                              blurRadius: 1,
                              offset: Offset(1, 0),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.only(
                            top: 18, left: 10, right: 10, bottom: 10),
                        child: Text(
                          "To calculate your personal footprint , Click on the button ! 👇👇👇",
                          style: TextStyle(
                            fontFamily: "Body",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                          height: 52,
                          width: 30,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: const Color.fromARGB(255, 71, 71, 71),blurRadius: 40,offset: Offset(1, 1),),
                            ]
                          ),
                          padding: EdgeInsets.only(bottom: 25),
                          child: Image.asset(
                            "assets/images/pinrv.png",
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(106, 192, 66, 1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(38, 41, 37, 0.29),
                          blurRadius: 15,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        navigate(context, QuestionsPerson());
                      },
                      child: Text(
                        // "${getLang(context, "calculate")}",
                        "Calculate Your footprint",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: "Title"
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 180,
                          child: Image.asset(
                            "assets/images/happyEarth.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(38, 41, 37, 0.29),
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.only(
                              top: 18, left: 10, right: 10, bottom: 10),
                          child: Text(
                            "Well done ! You are offsetting 500 kgCO2",
                            style: TextStyle(
                              fontFamily: "Body",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
