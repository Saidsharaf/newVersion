import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:revive/models/appModel/login_model.dart';
import 'package:revive/modules/LoginAndReg/cubitForLogin/cubit.dart';
import 'package:revive/modules/LoginAndReg/cubitForLogin/state.dart';
import 'package:revive/modules/betweenOwner_Customer/profile_screen/profile_screen/tree.dart';
import 'package:revive/shared/component/component.dart';
import 'package:revive/shared/network/end_point.dart';
import 'package:revive/shared/network/local/shared_pref.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          // if (state is loginSuccessState) {
          //   if (state.loginModel.status!) {
          //     name = state.loginModel.data!.image.toString();
          //   }
          // }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 90, 206, 94),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 120,
                        ),
                        height: 200,
                        width: 288,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.green),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(38, 41, 37, 0.29),
                              blurRadius: 15,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: Color.fromARGB(255, 68, 124, 70),
                              child: CircleAvatar(
                                radius: 33.3,
                                backgroundImage: NetworkImage(server+sharedPref.getData(key: "profilePic")),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              sharedPref.getData(key: "username"),
                              style: TextStyle(
                                  fontFamily: "Body",
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 38),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        "30",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: "Body",
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Followers",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          //fontFamily: "Name",
                                          fontSize: 16,
                                          //  fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "10",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontFamily: "Body",
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Following",
                                        style: TextStyle(
                                          color: Colors.black54,
                                          // fontFamily: "Name",
                                          fontSize: 16,
                                          //fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Footprint",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Body",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Your carbon footprint in kg if you lived like today every day of the year",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Name",
                            fontWeight: FontWeight.w800,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 400,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color.fromARGB(255, 90, 206, 94),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(38, 41, 37, 0.29),
                                    blurRadius: 8,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/earth.png"),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 90,
                                    ),
                                    Text(
                                      "500",
                                      style: TextStyle(
                                        fontSize: 64,
                                        fontFamily: "Body",
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 2.5,
                                      ),
                                    ),
                                    Text(
                                      "kg of CO2 per year",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Revive",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          buildIcon(
                              shadowColor: Color.fromRGBO(89, 236, 255, 0.282),
                              icon: Icons.home,
                              padd: EdgeInsets.all(40.0),
                              color: Color.fromARGB(255, 63, 110, 124)),
                          buildIcon(
                              shadowColor: Color.fromRGBO(72, 207, 133, 0.282),
                              icon: Icons.fastfood,
                              padd: EdgeInsets.only(
                                top: 320,
                                left: 245,
                              ),
                              color: Color.fromARGB(255, 10, 38, 71)),
                          buildIcon(
                              padd: EdgeInsets.only(left: 40, top: 305),
                              shadowColor: Color.fromRGBO(24, 218, 88, 0.282),
                              icon: Icons.access_time,
                              color: Color.fromARGB(255, 2, 91, 97)),
                          buildIcon(
                              padd: EdgeInsets.only(top: 70, left: 250),
                              shadowColor: Color.fromRGBO(89, 216, 255, 0.282),
                              icon: Icons.bus_alert,
                              color: Color.fromARGB(255, 36, 114, 101)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            navigate(context, Tree());
                          },
                          child: Container(
                            height: 50,
                            width: 230,
                            decoration: BoxDecoration(
                              color: Colors.red[400],
                              borderRadius: BorderRadius.circular(17),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(38, 41, 37, 0.29),
                                  blurRadius: 1,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "just click it !",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "Revive",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
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
